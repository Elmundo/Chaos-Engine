//
//  CTilemapRendererComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 01/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CTilemapRendererComponent.h"

@implementation CTilemapRendererComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    NSError *error;
    _tbxml = [TBXML newTBXMLWithXMLFile:_tilemapDataName error:&error];
    _rootElement = _tbxml.rootXMLElement;
    
    _sceneManager = [CSceneManager shared];
    CScene *activeScene = [_sceneManager activeScene];
    _layers = [activeScene layers];
    
    _tilesetDic = [[NSMutableDictionary alloc] init];
    _tiles      = [[NSMutableArray alloc] init];
    
    [self traverseElement:_rootElement];
}

/* Traverse the tilemap in TBX format */
- (void)traverseElement:(TBXMLElement *)element
{
    if (element == nil) {
        return;
    }
    
    if ([[TBXML elementName:element] isEqualToString:@"map"]) {
        _width      = [[TBXML valueOfAttributeNamed:@"width" forElement:element] floatValue];
        _height     = [[TBXML valueOfAttributeNamed:@"height" forElement:element] floatValue];
        _tileWidth  = [[TBXML valueOfAttributeNamed:@"tilewidth" forElement:element] floatValue];
        _tileHeight = [[TBXML valueOfAttributeNamed:@"tileheight" forElement:element] floatValue];
        
        [self traverseElement:element->firstChild];
        
    }else if ([[TBXML elementName:element] isEqualToString:@"tileset"]){
        
        CGFloat tileWidth  = [[TBXML valueOfAttributeNamed:@"tilewidth" forElement:element] floatValue];
        CGFloat tileHeight = [[TBXML valueOfAttributeNamed:@"tileheight" forElement:element] floatValue];
        
        TBXMLElement *imageElement = element->currentChild;
        CGFloat width  = [[TBXML valueOfAttributeNamed:@"width" forElement:imageElement] floatValue];
        CGFloat height = [[TBXML valueOfAttributeNamed:@"height" forElement:imageElement] floatValue];
        
        int widthGrid = width/tileWidth;
        int heightGrid = height/tileHeight;
        
        NSString *tilesetName = [TBXML valueOfAttributeNamed:@"source" forElement:imageElement];
        SKTexture *tilesetTexture = [SKTexture textureWithImageNamed:tilesetName];
        
        for (int i=0; i<heightGrid; ++i) {
            for (int j=0; j<widthGrid; ++j) {
                
                CGRect eulerRect = CGRectMake(j*tileWidth, i*tileHeight, tileWidth, tileHeight);
                CGRect unitRect = [CUtil eulerToUnit:eulerRect andResourceSize:CGSizeMake(width, height)];
                
                SKTexture *tile = [SKTexture textureWithRect:unitRect inTexture:tilesetTexture];
                [_tiles addObject:tile];
            }
        }
        
        [_tilesetDic setObject:tilesetTexture forKey:tilesetName];
        [self traverseElement:element->nextSibling];
        
    }else if ([[TBXML elementName:element] isEqualToString:@"layer"]){
        
        NSString *layerName = [TBXML valueOfAttributeNamed:@"name" forElement:element];
        int layerWidth = [[TBXML valueOfAttributeNamed:@"width" forElement:element] integerValue];
        int layerHeight = [[TBXML valueOfAttributeNamed:@"height" forElement:element] integerValue];
        
        CLayer *layer;
        for (CLayer *l in _layers) {
            if ([l.name isEqual:layerName]) {
                layer = l;
                break;
            }
        }
        
        TBXMLElement *tileElement = element->firstChild->firstChild;
        int gridMatrix[layerWidth][layerHeight];
        
        for (int i=0; i<layerHeight; ++i) {
            for (int j=0; j<layerWidth; ++j) {
                int gid = [[TBXML valueOfAttributeNamed:@"gid" forElement:tileElement] integerValue];
                
                /*TMX formatı upper-left corner, SpriteKit koordinat sistemi lower-left corner olduğundan,
                  tile'ları layer'a eklerken doğru sonucun çıkması için satırlar ters sırada matris'de saklanıyor. */
                gridMatrix[j][layerHeight-i-1] = gid;
                tileElement = tileElement->nextSibling;
            }
        }
        
        for (int i=0; i<layerHeight; ++i) {
            for (int j=0; j<layerWidth; ++j) {
                int gid = gridMatrix[j][i];
                if (gid == 0) {
                    // Empty tile
                }else{
                    SKTexture *gtexture = [_tiles objectAtIndex:gid-1];
                    CSpriteNode *grid = [CSpriteNode spriteNodeWithTexture:gtexture];
                    grid.anchorPoint = CGPointMake(0, 0);
                    grid.position = CGPointMake(j * _tileWidth, i * _tileHeight);
                    
                    [layer addChild:grid];
                }
            }
        }
        
        [self traverseElement:element->nextSibling];
    }
}

- (void)update:(NSTimeInterval)dt
{
    for (CLayer *l in _layers) {
        l.position = CGPointMake(l.position.x-1, l.position.y);
    }
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

@end

//
//  CTilemapRendererComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 01/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

@import CoreGraphics;
#import "CTilemapRendererComponent.h"

@implementation CTilemapRendererComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    NSError *error;
    _tbxml = [TBXML tbxmlWithXMLFile:_tilemapDataName error:&error];
    _rootElement = _tbxml.rootXMLElement;
    
    _sceneManager = [CSceneManager shared];
    CScene *activeScene = [_sceneManager activeScene];
    _layers = [activeScene layers];
    
    _tilesetDic = [[NSMutableDictionary alloc] init];
    _tiles      = [[NSMutableArray alloc] init];
    
    [self setCollisionBox:_rootElement];
    [self traverseElement:_rootElement];
}

/* First set the collision map in TBX format */
- (void)setCollisionBox:(TBXMLElement *)element
{
    TBXMLElement *root = element;
    TBXMLElement *layerNode = root->firstChild;
    
    while (layerNode) {
        
        if ([[TBXML elementName:layerNode] isEqualToString:@"layer"]){
            NSString *layerName = [TBXML valueOfAttributeNamed:@"name" forElement:layerNode];
            int layerWidth = [[TBXML valueOfAttributeNamed:@"width" forElement:layerNode] integerValue];
            int layerHeight = [[TBXML valueOfAttributeNamed:@"height" forElement:layerNode] integerValue];
            _collisionMatrix = [NSMutableArray arrayWithCapacity:layerHeight];
            
            if ([layerName isEqualToString:@"collision"]) {
                TBXMLElement *tileElement = layerNode->firstChild->firstChild;
                for (int i=0; i < layerHeight; ++i) {
                    NSMutableArray *list = [NSMutableArray array];
                    for (int j=0; j<layerWidth; ++j) {
                        
                        int gid = [[TBXML valueOfAttributeNamed:@"gid" forElement:tileElement] intValue];
                        NSNumber *collisionValue = [NSNumber numberWithInt:gid];
                        [list addObject:collisionValue];
                        tileElement = tileElement->nextSibling;
                    }
                    
                    [_collisionMatrix insertObject:list atIndex:i];
                    
                }
                
                for (int k=0; k < _collisionMatrix.count/2; ++k) {
                    [_collisionMatrix exchangeObjectAtIndex:k withObjectAtIndex:(_collisionMatrix.count-1-k)];
                }
                
                break;
            }
            
        }
        
        layerNode = layerNode->nextSibling;
    }
    
    NSLog(@"Get out of the while");
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
        
    }else if ([[TBXML elementName:element] isEqualToString:@"tileset"]){ //TODO: Birden fazla tileset olrsa patlar, revize olması lazım
        
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
        int gridMatrix[layerHeight][layerWidth];
        
        /*TMX formatı upper-left corner, SpriteKit koordinat sistemi lower-left corner olduğundan,
         tile'ları layer'a eklerken doğru sonucun çıkması için satırlar ters sırada matris'de saklanıyor. */
        for (int i=0; i<layerHeight; ++i) {
            for (int j=0; j<layerWidth; ++j) {
                int gid = [[TBXML valueOfAttributeNamed:@"gid" forElement:tileElement] integerValue];
                gridMatrix[layerHeight-i-1][j] = gid;
                tileElement = tileElement->nextSibling;
            }
        }
        
        /* Adding all tiles to layer*/
        for (int i=0; i<layerHeight; ++i) {
            NSArray *list = [_collisionMatrix objectAtIndex:i];
            for (int j=0; j<layerWidth; ++j) {
                int gid = gridMatrix[i][j];
                if (gid == 0) {
                    // Empty tile, do nothing
                }else{
                    SKTexture *gtexture     = [_tiles objectAtIndex:gid-1];
                    gtexture.filteringMode  = SKTextureFilteringNearest; // This mode is faster, and the results are often pixelated.
                    CSpriteNode *grid       = [CSpriteNode spriteNodeWithTexture:gtexture];
                    grid.anchorPoint        = CGPointMake(0, 0);
                    grid.position           = CGPointMake(j * _tileWidth, i * _tileHeight);
                    
                    NSNumber *value = [list objectAtIndex:j];
                    if ([value integerValue] != 0) {
                        grid.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(_tileWidth, _tileHeight)];
                        grid.physicsBody.dynamic = NO;
                        /* TODO: This part should be set from XML*/
                        grid.physicsBody.categoryBitMask = 0x1;
                        grid.physicsBody.contactTestBitMask = 0x1;
                        grid.physicsBody.collisionBitMask = 0x1;
                    }
                    
                    [layer addChild:grid];
                }
            }
        }
        
        [self traverseElement:element->nextSibling];
    }
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

@end

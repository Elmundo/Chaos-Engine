//
//  CTileRendererComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CTileRendererComponent.h"
#import "CPropertyReference.h"

@implementation CTileRendererComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _spriteNode = [owner getProperty:_spriteProperty];
    _textureAtlas = [owner getProperty:_atlasProperty];
    _layer = [owner getProperty:_layerProperty];
    
    _tileMatrix = [NSMutableArray array];
    _xmlURL = [[NSBundle mainBundle] URLForResource:_tileMapData withExtension:@"xml"];
    _parser = [[NSXMLParser alloc] initWithContentsOfURL:_xmlURL];
    
    [_parser setDelegate:self];
    [_parser setShouldResolveExternalEntities:YES];
    [_parser parse];
}

- (void)didRemovedFromEntity
{
    [self didRemovedFromEntity];
}

/* Deserialize TileMap XML Data */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"TileMap"]) {
        //
    }
    else if ([elementName isEqualToString:@"row"])
    {
        _row = [NSMutableArray array];
        [_tileMatrix addObject:_row];
    }
    else if ([elementName isEqualToString:@"column"])
    {
        NSString *tileName = [attributeDict objectForKey:@"tileName"];
        [_row addObject:tileName];
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self initializeTileMap];
}

- (void)initializeTileMap
{
    int i=0;
    int j=0;
    
    for (NSArray *row in _tileMatrix) {
        j = 0;
        for (NSString *tileName in row) {
            
            SKTexture *tileTexture = [_textureAtlas tileWithName:tileName andTilesetName:@"Environment"];
            CSpriteNode *spriteNode = [CSpriteNode spriteNodeWithTexture:tileTexture];
            CGPoint position = CGPointMake(j*_tileWidth, i*_tileHeight);
            spriteNode.position = position;
            [_layer addChild:spriteNode];
            j++;
        }
        i++;
    }
}

- (void)update:(NSTimeInterval)dt
{
    [self moveTilesX:0 y:-1];
}

- (void)moveTilesX:(float)x y:(float)y
{
    _layer.position = CGPointMake(_layer.position.x + x, _layer.position.y + y);
}

@end

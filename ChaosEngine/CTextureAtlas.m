//
//  CTextureAtlas.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/21/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CTextureAtlas.h"

@implementation CTextureAtlas

+ (CTextureAtlas *)atlasWithXmlName:(NSString *)xmlName andWithResource:(SKTexture *)resource
{
    CTextureAtlas *atlas = [[CTextureAtlas alloc] initWithXmlName:xmlName andWithResource:resource];
    return atlas;
}

- (id)initWithXmlName:(NSString *)xmlName andWithResource:(SKTexture *)resource
{
    self = [super init];
    if (self) {
        _xmlURL = [[NSBundle mainBundle] URLForResource:xmlName withExtension:@"xml"];
        _parser = [[NSXMLParser alloc] initWithContentsOfURL:_xmlURL];
        _atlas  = resource;
        
        [_parser setDelegate:self];
        [_parser setShouldResolveExternalEntities:YES];
        [_parser parse];
    }

    return self;
}

- (NSArray *)animationWithName:(NSString *)animationName
{
    NSArray *list = [_textureAtlas objectForKey:animationName];
    if (!list) {
        cerror(@"There is no %@ animation list", animationName);
    }
    
    return list;
}

- (SKTexture *)getFirstTexture
{
    NSArray *list;
    for (NSString *key in _textureAtlas) {
        list = [_textureAtlas objectForKey:key];
        break;
    }
    
    return [list objectAtIndex:0];
}

/* Deserialize TextureAtlas XML Data */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // Initialize Texture Atlas object
    if ([elementName isEqualToString:@"TextureAtlas"]) {
        
        _textureAtlas = [[NSMutableDictionary alloc] init];
        
        for (NSString *key in attributeDict) {
            
            if ([key isEqualToString:@"type"]) continue;
            
            if ([self respondsToSelector:NSSelectorFromString(key)])
                [self setValue:[attributeDict objectForKey:key] forKey:key];
            else
                cerror(@"There is no such a property: %@", key);
        }
    }
    
    // Initialize Animation List and Add Texture Atlas Map
    if ([elementName isEqualToString:@"animation"]) {
        
        _animationList = [[NSMutableArray alloc] init];
        
        [_textureAtlas setObject:_animationList forKey:[attributeDict objectForKey:@"name"]];
    }
    
    // Initialize Animation Texture and Add Animation List
    if ([elementName isEqualToString:@"texture"]) {
        
        NSNumber *x = [attributeDict objectForKey:@"x"];
        NSNumber *y = [attributeDict objectForKey:@"y"];
        NSNumber *w = [attributeDict objectForKey:@"w"];
        NSNumber *h = [attributeDict objectForKey:@"h"];
        
        CGRect eulerRect = CGRectMake([x intValue],
                                 [y intValue],
                                 [w intValue],
                                 [h intValue]);
        CGRect unitRect = [CUtil eulerToUnit:eulerRect andResourceSize:_atlas.size];
        if (!_atlas) {
            cerror(@"Texture Atlas is null");
            return;
        }
        SKTexture *texturePart = [SKTexture textureWithRect:unitRect inTexture:_atlas];
        [_animationList addObject:texturePart];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{

}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{

}

@end

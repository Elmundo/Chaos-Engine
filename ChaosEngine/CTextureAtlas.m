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

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"TextureAtlas"]) {
        
        _textureAtlas = [[NSMutableDictionary alloc] init];
        
        for (NSString *key in attributeDict) {
            
            if ([key isEqualToString:@"type"]) continue;
            
            if ([self respondsToSelector:NSSelectorFromString(key)])
                [self setValue:[attributeDict objectForKey:key] forKey:key];
            else
                NSLog(@"There is no such a property: %@", key);
        }
    }
    
    if ([elementName isEqualToString:@"animation"]) {
        
        _animationList = [[NSMutableArray alloc] init];
        
        [_textureAtlas setObject:_animationList forKey:[attributeDict objectForKey:@"name"]];
    }
    
    if ([elementName isEqualToString:@"texture"]) {
        
        NSNumber *x = [attributeDict objectForKey:@"x"];
        NSNumber *y = [attributeDict objectForKey:@"y"];
        NSNumber *w = [attributeDict objectForKey:@"w"];
        NSNumber *h = [attributeDict objectForKey:@"h"];
        
        CGRect rect = CGRectMake([x intValue],
                                 [y intValue],
                                 [w intValue],
                                 [h intValue]);
        
        SKTexture *texturePart = [SKTexture textureWithRect:rect inTexture:_atlas];
        [_animationList addObject:texturePart];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"End");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"Document End");
}

@end

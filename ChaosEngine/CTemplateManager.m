//
//  CTemplateManager.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CTemplateManager.h"

@implementation CTemplateManager

- (id)init
{
    self = [super init];
    if (self) {
        _parser = [[NSXMLParser alloc] init];
        _depthLevel = -1;
    }
    
    [self testTBXML];
    
    return self;
}

- (void)testTBXML
{
    NSError *error;
    TBXML *tbxml = [TBXML newTBXMLWithXMLFile:@"test_level.clevel" error:&error];
    TBXMLElement *rootElement = tbxml.rootXMLElement;
    
    [self traverseElement:rootElement];
}

- (void)traverseElement:(TBXMLElement *)element
{
    _depthLevel++;
    NSLog(@"Depth Level: %d", _depthLevel);
    TBXMLElement *currentElemenet = element;
    while (currentElemenet) {
        
        TBXMLAttribute *currentAttribute = element->firstAttribute;
        NSLog(@"Element: name=%s", currentElemenet->name);
        while (currentAttribute) {
            NSLog(@"    Attribute: name=%s", currentAttribute->name);
            NSLog(@"    Attribute: value=%s", currentAttribute->value);
            
            currentAttribute = currentAttribute->next;
        }
        NSLog(@"Element: text=%s", element->text);
        
        if (element->firstChild) {
            [self traverseElement:element->firstChild];
            _depthLevel--;
        }
        
        currentElemenet = currentElemenet->nextSibling;
    }
}

- (void)update:(NSTimeInterval)dt
{
    // Some Stuff
}

- (void)addXML:(NSString *)xml identifier:(NSString *)identifier
{
    
}

- (void)removeXML:(NSString *)xml
{
    
}

/* Deserialize TextureAtlas XML Data */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
}

- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment
{
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

@end

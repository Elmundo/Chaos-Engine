//
//  CSerializable.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/29/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CSerializable.h"

@implementation CSerializable : NSObject 

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

@end

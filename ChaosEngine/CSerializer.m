//
//  CSerializer.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CSerializer.h"

@implementation CSerializer

+ (CSerializer *)shared
{
    static CSerializer *instance = nil;
    if (!instance) {
        instance = [CSerializer new];
    }
    
    return instance;
}

// Serialize an object to TBXML.
- (TBXMLElement *)serialize:(id)object
{
    return nil;
}

// Deserializes an object from an TBXML description.
- (id)deserialize:(TBXMLElement *)xml
{
    /* TBXElement could be three type: Entity, Template, Group */
    
    TBXMLElement *currentElement = xml;
    while (currentElement) {
        
        if (strcmp(currentElement->name, "Component") == 0) {
            
            NSString *componentType = [TBXML valueOfAttributeNamed:@"type" forElement:currentElement];
            Class classObj = NSClassFromString(componentType);
            id obj = [[classObj alloc] init];
            
            if (currentElement) {
                [self traverseObject:currentElement object:obj];
            }
        }
    }
    
    return nil;
}

- (id)traverseObject:(TBXMLElement *)xml object:(id)object
{
    TBXMLElement *currentElement = xml;
    [self setProperties: object];
    
    TBXMLElement *childElement = currentElement->firstChild;
    while (childElement) {

        NSString *propertyName = [NSString stringWithUTF8String:childElement->name];
        id propertyObject = [object valueForKey:propertyName];
        [self traverseObject:childElement object:propertyObject];
        
        childElement = childElement->nextSibling;
    }
    
    return nil;
}

- (void)setProperties:(id)object
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    
    for (i=0; i < outCount; ++i) {
        objc_property_t property = properties[i];
        const char * propName = property_getName(property);
        if (propName) {
            NSString *propType = [self propertyTypeStringOfProperty:property];
            
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            NSString *propertyType = [NSString stringWithString:propType];

            Class classObj = NSClassFromString(propertyType);
            id obj = [[classObj alloc] init];
            [object setValue:obj forKey:propertyName];
            
        }
    }
    
    free(properties);
}

- (NSString *)propertyTypeStringOfProperty:(objc_property_t) property {
    const char *attr = property_getAttributes(property);
    NSString *const attributes = [NSString stringWithCString:attr encoding:NSUTF8StringEncoding];
    
    NSRange const typeRangeStart = [attributes rangeOfString:@"T@\""];  // start of type string
    if (typeRangeStart.location != NSNotFound) {
        NSString *const typeStringWithQuote = [attributes substringFromIndex:typeRangeStart.location + typeRangeStart.length];
        NSRange const typeRangeEnd = [typeStringWithQuote rangeOfString:@"\""]; // end of type string
        if (typeRangeEnd.location != NSNotFound) {
            NSString *const typeString = [typeStringWithQuote substringToIndex:typeRangeEnd.location];
            return typeString;
        }
    }
    return nil;
}

@end

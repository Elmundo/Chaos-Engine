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
    NSMutableArray *componentList = [NSMutableArray array];
    /* Creates the components of Entity */
    while (currentElement) {
        
        if (strcmp(currentElement->name, "Component") == 0) {
            
            NSString *componentType = [TBXML valueOfAttributeNamed:@"type" forElement:currentElement];
            Class classObj = NSClassFromString(componentType);
            id obj = [[classObj alloc] init];
            
            if (currentElement) {
                [self traverseObject:currentElement object:obj];
            }
        }
        
        currentElement = currentElement->nextSibling;
    }
    
    return nil;
}

- (id)traverseObject:(TBXMLElement *)xml object:(id)object
{
    TBXMLElement *currentElement = xml;
    [self setProperties: object xml:currentElement];
    
    TBXMLElement *childElement = currentElement->firstChild;
    while (childElement) {

        NSString *propertyName = [NSString stringWithUTF8String:childElement->name];
        id propertyObject = [object valueForKey:propertyName];
        [self traverseObject:childElement object:propertyObject];
        
        childElement = childElement->nextSibling;
    }
    
    return nil;
}

- (void)setProperties:(id)object xml:(TBXMLElement *)element
{
    TBXMLElement *childElement = element->firstChild;
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    
    for (i=0; i < outCount; ++i) {
        objc_property_t property = properties[i];
        const char * propName = property_getName(property);
        enum PropertyType outType;
        
        if (propName) {
            NSString *propType = [self propertyTypeStringOfProperty:property propertyType:&outType];
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            NSString *propertyType = [NSString stringWithString:propType];
            
            /* Class */
            if (outType == PropertyTypeClass) {
                Class classObj = NSClassFromString(propertyType);
                id obj = [[classObj alloc] init];
                [object setValue:obj forKey:propertyName];
            }/* Object */
            else if(outType == PropertyTypeObject) {
                [self setObjectValue:object xml:childElement propertyName:propertyName propertyType:propType];
            }/* Scalar */
            else if(outType == PropertyTypeScalar) {
                [self setScalarValue:object xml:childElement propertyName:propertyName propertyType:propType];

            }
        }
        
        childElement = childElement->nextSibling;
    }
    
    free(properties);
}
- (void)setObjectValue:(id)object xml:(TBXMLElement *)element propertyName:(NSString *)name propertyType:(NSString *)type
{
    //Objective-C types
    if ([type isEqualToString:@"NSString"]) {
        NSString *stringValue = [TBXML textForElement:element];
        [object setValue:stringValue forKey:name];
    }else if([type isEqualToString:@"NSArray"]){
        NSArray *list = [NSArray array];
        [object setValue:list forKey:type];
    }else if([type isEqualToString:@"NSDictionary"]){
        NSDictionary *dic = [NSDictionary dictionary];
        [object setValue:dic forKey:type];
    }
}

- (void)setScalarValue:(id)object xml:(TBXMLElement *)element propertyName:(NSString *)name propertyType:(NSString *)type
{
    // Still do not know what to do
    //Scalar types
    if ([type isEqualToString:@"c"]) {
        
    }else if([type isEqualToString:@"i"])
    {
        NSString *stringValue = [TBXML textForElement:element];
        int temp = [stringValue intValue];
        [object valueForKey:name];
        
    }else if([type isEqualToString:@"f"]){
        
    }
}

- (NSString *)propertyTypeStringOfProperty:(objc_property_t) property propertyType:(enum PropertyType *)outType
{
    const char *attributes = property_getAttributes(property);
    //printf("attributes=%s\n", attributes);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            // it's a C primitive type:
            /*
             if you want a list of what will be returned for these primitives, search online for
             "objective-c" "Property Attribute Description Examples"
             apple docs list plenty of examples of what you get for int "i", long "l", unsigned "I", struct, etc.
             */
            enum PropertyType pt = PropertyTypeScalar;
            *outType = pt;
            NSString *name = [[NSString alloc] initWithBytes:attribute + 1 length:strlen(attribute) - 1 encoding:NSASCIIStringEncoding];
            return name;
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // it's an ObjC id type:
            enum PropertyType pt = PropertyTypeClass;
            *outType = pt;
            return @"id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // it's another ObjC object type:
            
            enum PropertyType pt;
            NSString *name = [[NSString alloc] initWithBytes:attribute + 3 length:strlen(attribute) - 4 encoding:NSASCIIStringEncoding];
            if ([name isEqualToString:@"NSString"] || [name isEqualToString:@"NSArray"] || [name isEqualToString:@"NSDictionary"]
                || [name isEqualToString:@"NSNumber"] || [name isEqualToString:@"NSDecimalNumber"] || [name isEqualToString:@"NSDate"]) {
                pt = PropertyTypeObject;
            }
            else
                pt = PropertyTypeClass;
            
            *outType = pt;
            return name;
        }
    }
    return nil;
}

@end

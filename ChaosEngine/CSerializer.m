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

/******************************************************************/
/*                                                                */
/* Data Structures are not ready for implementing - Coming soon.. */
/*                                                                */
/******************************************************************/
// Working as branch-first traversing in nested struct

- (id)traverseObject:(TBXMLElement *)parentXMLElement object:(id)parentObject
{
    unsigned int outPropertyCount, i = 0;
    enum PropertyType outType;
    objc_property_t *properties = class_copyPropertyList([parentObject class], &outPropertyCount);

    for (; i < outPropertyCount; ++i) {
        objc_property_t property = properties[i];
        
        // Get ParentObject's property's type and name values
        NSString *propertyName    = [NSString stringWithUTF8String:property_getName(property)];
        NSString *propertyType    = [self propertyTypeStringOfProperty:property propertyType:&outType];
        TBXMLElement *propertyXMLElement = [TBXML childElementNamed:propertyName parentElement:parentXMLElement];
        
        // Instantiate the related property with type
        /* Class */
        if (outType == PropertyTypeClass) {
            Class classObj = NSClassFromString(propertyType);
            id propertyObject = [[classObj alloc] init];
            
            if (!propertyXMLElement) {
                NSLog(@"XML ELEMENT MISSING!: There is no match in XML with property name: %@", propertyName);
                continue;
            }
            
            [self traverseObject:propertyXMLElement object:propertyObject];
            
            [parentObject setValue:propertyObject forKey:propertyName];
            
        }/* Collection */
        else if(outType == PropertyTypeCollection) {
            
            Class classObj = NSClassFromString(propertyType);
            id collectionObject = [[classObj alloc] init];
            
            NSString *propertyType = [TBXML valueOfAttributeNamed:@"type" forElement:propertyXMLElement];
            TBXMLElement *childXMLElement = propertyXMLElement->firstChild;
            
            while (childXMLElement) {
                
                Class classObj = NSClassFromString(propertyType);
                id propertyObject = [[classObj alloc] init];
                
                if (!propertyXMLElement) {
                    NSLog(@"XML ELEMENT MISSING!: There is no match in XML with property name: %@", propertyName);
                    continue;
                }
                
                [self traverseObject:childXMLElement object:propertyObject];
                
                if ([collectionObject isKindOfClass:[NSMutableArray class]]) {
                    [(NSMutableArray*)collectionObject addObject:propertyObject];
                }else if ([collectionObject isKindOfClass:[NSMutableDictionary class]]) {
                    NSString *propertyName = [TBXML elementName:childXMLElement];
                    [collectionObject setObject:propertyObject forKey:propertyName];
                }
                
                childXMLElement = childXMLElement->nextSibling;
            }
        }/* Scalar */
        else if(outType == PropertyTypeScalar) {
            [self setScalarValue:parentObject xml:parentXMLElement propertyName:propertyName propertyType:propertyType];
            
        }
    }
    
    return nil;
}

- (void)setProperties:(id)parentOject xml:(TBXMLElement *)element
{
    TBXMLElement *childElement = element->firstChild;
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([parentOject class], &outCount);
    
    for (i=0; i < outCount; ++i) {
        objc_property_t property = properties[i];
        const char * propName = property_getName(property);
        enum PropertyType outType;
        
        if (propName) {
            if (!childElement->name) {
                @throw @"XML Element is corrupted!";
            }
            
            NSString *propType = [self propertyTypeStringOfProperty:property propertyType:&outType];
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            NSString *propertyType = [NSString stringWithString:propType];
            NSLog(@"PropertyName = %@", propertyName);
            NSLog(@"PropertyType = %@", propertyType);
            NSLog(@"XMLElement Name = %s", childElement->name);
            
            /* Class */
            if (outType == PropertyTypeClass) {
                Class classObj = NSClassFromString(propertyType);
                id obj = [[classObj alloc] init];
                [parentOject setValue:obj forKey:propertyName];
            }/* Object */
            else if(outType == PropertyTypeCollection) {
                [self setObjectValue:parentOject xml:childElement propertyName:propertyName propertyType:propType];
            }/* Scalar */
            else if(outType == PropertyTypeScalar) {
                [self setScalarValue:parentOject xml:childElement propertyName:propertyName propertyType:propType];

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
        [object setValue:list forKey:name];
    }else if([type isEqualToString:@"NSDictionary"]){
        NSDictionary *dic = [NSDictionary dictionary];
        [object setValue:dic forKey:name];
    }
}

- (void)setScalarValue:(id)object xml:(TBXMLElement *)element propertyName:(NSString *)name propertyType:(NSString *)type
{
// Little tricky macro - Only available in this scope
#define isEqual(t) [type isEqualToString:t]
    
    NSString *stringValue = [TBXML textForElement:element];
    NSNumber *scalarValue;
    
    //Wrapping and Unwrapping Scalar Types
    //BOOL
    if (isEqual(@"B"))
        scalarValue = [NSNumber numberWithBool:[stringValue boolValue]];
    //char
    else if (isEqual(@"c"))
        scalarValue = [NSNumber numberWithChar:[stringValue characterAtIndex:0]];
    //double
    else if (isEqual(@"d"))
        scalarValue = [NSNumber numberWithDouble:[stringValue doubleValue]];
    //float
    else if (isEqual(@"f"))
        scalarValue = [NSNumber numberWithFloat:[stringValue floatValue]];
    //int
    else if (isEqual(@"i"))
        scalarValue = [NSNumber numberWithInt:[stringValue intValue]];
    //long - Attention! l is treated as a 32-bit quantity on 64-bit programs.
    else if (isEqual(@"l"))
        scalarValue = [NSNumber numberWithLong:[stringValue longLongValue]];
    //long long
    else if (isEqual(@"q"))
        scalarValue = [NSNumber numberWithLongLong:[stringValue longLongValue]];
    //short
    else if (isEqual(@"s"))
        scalarValue = [NSNumber numberWithShort:[stringValue intValue]];
    //unsigned char
    else if (isEqual(@"C"))
        scalarValue = [NSNumber numberWithUnsignedChar:[stringValue characterAtIndex:0]];
    //unsigned int
    else if (isEqual(@"I"))
        scalarValue = [NSNumber numberWithUnsignedInt:[stringValue intValue]];
    //unsigned long
    else if (isEqual(@"L"))
        scalarValue = [NSNumber numberWithUnsignedLong:[stringValue longLongValue]];
    //unsigned long long
    else if (isEqual(@"Q"))
        scalarValue = [NSNumber numberWithUnsignedLongLong:[stringValue longLongValue]];
    //unsigned short
    else if (isEqual(@"S"))
        scalarValue = [NSNumber numberWithUnsignedShort:[stringValue intValue]];
    
    [object setValue:scalarValue forKey:name];
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
            if ([name isEqualToString:@"NSMutableArray"] || [name isEqualToString:@"NSMutableDictionary"] ||
                [name isEqualToString:@"NSArray"] || [name isEqualToString:@"NSDictionary"]) {
                pt = PropertyTypeCollection;
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

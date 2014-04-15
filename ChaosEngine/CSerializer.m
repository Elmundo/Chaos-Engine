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
- (NSArray *)deserialize:(TBXMLElement *)xml
{
    NSMutableArray *components = [NSMutableArray array];
    TBXMLElement *currentElement = xml;
    /* Creates the components of Entity */
    while (currentElement) {
        
        if (strcmp(currentElement->name, "Component") == 0) {
            NSString *componentType = [TBXML valueOfAttributeNamed:@"type" forElement:currentElement];
            Class classObj = NSClassFromString(componentType);
            id obj = [[classObj alloc] init];
            //TODO: Obje nil ise hata bas.
            
            if (currentElement) {
                [self traverseObject:currentElement object:obj];
            }
            
            [components addObject:obj];
        }
        
        currentElement = currentElement->nextSibling;
    }
    
    return components;
}

/******************************************************************/
/*                                                                */
/* Data Structures are not ready for implementing - Coming soon.. */
/*                                                                */
/******************************************************************/
// Working as branch-first traversing in nested struct

- (void)traverseObject:(TBXMLElement *)parentXMLElement object:(id)parentObject
{
    unsigned int outPropertyCount, i = 0;
    enum PropertyType outType;
    objc_property_t *properties = class_copyPropertyList([parentObject class], &outPropertyCount);

    for (; i < outPropertyCount; ++i) {
        objc_property_t property = properties[i];
        
        // Get Objective-C ParentObject's property type and name values
        NSString *propertyName    = [NSString stringWithUTF8String:property_getName(property)];
        NSString *propertyType    = [self propertyTypeStringOfProperty:property propertyType:&outType];
        TBXMLElement *propertyXMLElement = [TBXML childElementNamed:propertyName parentElement:parentXMLElement];
        
        //There is no match in XML for propertyName so skip that!
        if (propertyXMLElement == Nil) {
            clog(@"['%@']property is defined in ['%s']Objective-C class, not in XML definition", propertyName, class_getName([parentObject class]));
            continue;
        }
        
        /* CSerializable object */
        if ([NSClassFromString(propertyType) isSubclassOfClass:[CSerializable class]]) {
            Class classObj = NSClassFromString(propertyType);
            CSerializable *propertyObject = [[classObj alloc] init];
            [propertyObject deserialize:propertyXMLElement];
            [parentObject setValue:propertyObject forKey:propertyName];
        }
        // Instantiate the related property with type
        /* String*/
        else if (outType == PropertyTypeString) {
            NSString *stringValue = [TBXML textForElement:propertyXMLElement];
            [parentObject setValue:stringValue forKey:propertyName];
        }
        /* Class */
        else if (outType == PropertyTypeClass) {
            Class classObj = NSClassFromString(propertyType);
            id propertyObject = [[classObj alloc] init];
            
            if (!propertyXMLElement) {
                cerror(@"XML ELEMENT MISSING!: There is no match in XML with property name: %@", propertyName);
                continue;
            }
            
            // NSString is a unique class which does not need to be traversed.
            // If type is NSString, do not traverse, just assign the string value
            if ([propertyType isEqualToString:@"NSString"]) {
                propertyObject = [NSString stringWithFormat:@"%s", propertyXMLElement->text];
            }else{
                [self traverseObject:propertyXMLElement object:propertyObject];
            }
            
            [parentObject setValue:propertyObject forKey:propertyName];
            
        }/* Collection */
        else if(outType == PropertyTypeCollection) {
            
            Class classObj = NSClassFromString(propertyType);
            id collectionObject = [[classObj alloc] init];
            
            [self traverseCollection:propertyXMLElement object:collectionObject];
            
            [parentObject setValue:collectionObject forKey:propertyName];
          
        }/* Scalar */
        else if(outType == PropertyTypeScalar) {
            [self setScalarValue:parentObject xml:propertyXMLElement propertyName:propertyName propertyType:propertyType];
            
        }
    }
}

- (void)traverseCollection:(TBXMLElement *)parentXMLElement object:(id)collectionObject
{
    // Parent object's child type is unknown in Class Definition, so wee need to get this information from XML definition
    // We get the value of type attribute so we could determine the type of object which will be created.
    NSString *childType = [TBXML valueOfAttributeNamed:@"type" forElement:parentXMLElement];
    TBXMLElement *supportXMLElement = parentXMLElement->firstChild;
    
    while (supportXMLElement) {
        
        NSString *supportName = [TBXML elementName:supportXMLElement];
        TBXMLElement *childXMLElement = supportXMLElement->firstChild;
        Class classObj = NSClassFromString(childType);
        id childObject = [[classObj alloc] init];
        
        if (!childXMLElement) {
            cerror(@"XML ELEMENT MISSING!: There is no match in XML with property name: %@", childType);
            continue;
        }
        
        if ([childType isEqualToString:@"NSMutableArray"]) {
            //Avoid "_" element, pass child of it instead; "_" is not a property to add directly
            [self traverseCollection:childXMLElement object:childObject];
        }else if ([childType isEqualToString:@"NSMutableDictionary"])
        {
            //Avoid "KeyValue" element, pass child of it instead; "KeyValue" is not a property to add directly
            [self traverseCollection:childXMLElement object:childObject];
        }else{
            [self traverseObject:supportXMLElement object:childObject];
        }
        
        if ([collectionObject isKindOfClass:[NSMutableArray class]]) {
            [(NSMutableArray*)collectionObject addObject:childObject];
        }else if ([collectionObject isKindOfClass:[NSMutableDictionary class]]) {
            [collectionObject setObject:childObject forKey:supportName];
        }else{
            [collectionObject setObject:childObject forKey:supportName];
        }

        supportXMLElement = supportXMLElement->nextSibling;
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
        scalarValue = [NSNumber numberWithLongLong:[stringValue longLongValue]];
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
        scalarValue = [NSNumber numberWithUnsignedLongLong:[stringValue longLongValue]];
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
            else if([name isEqualToString:@"NSString"])
                pt = PropertyTypeString;
            else
                pt = PropertyTypeClass;
            
            *outType = pt;
            return name;
        }
    }
    return nil;
}

@end

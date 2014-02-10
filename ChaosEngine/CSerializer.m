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
    
    /* Delete later */
    char *name = @encode(char);
    fprintf(stdout, "name= %s\n", name);
    
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
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    
    for (i=0; i < outCount; ++i) {
        objc_property_t property = properties[i];
        const char * propName = property_getName(property);
        if (propName) {
            NSString *propType = [self propertyTypeStringOfProperty:property];
            if ([self isScalarType:propType]) {
                [self setScalarValue:object xml:element propertyType:propType];
            }
            else{ //Object to be initiated
                NSString *propertyName = [NSString stringWithUTF8String:propName];
                NSString *propertyType = [NSString stringWithString:propType];
                
                Class classObj = NSClassFromString(propertyType);
                id obj = [[classObj alloc] init];
                [object setValue:obj forKey:propertyName];
            }
            
        }
    }
    
    free(properties);
}

- (void)setScalarValue:(id)obj xml:(TBXMLElement *)element propertyType:(NSString *)type
{
    //Scalar types
    if ([type isEqualToString:@"c"]) {
        NSString *string =  [element->text];
        char c =
    }else if([type isEqualToString:@"i"])
    {
        
    }else if([type isEqualToString:@"f"]){
        
    }
}

- (BOOL)isScalarType:(NSString *)type
{
    if ([type isEqualToString:@"i"] || [type isEqualToString:@"c"] || [type isEqualToString:@"f"] ||
        [type isEqualToString:@"NSString"]  || [type isEqualToString:@"NSArray"] || [type isEqualToString:@"NSDictionary"] ||
        [type isEqualToString:@"NSNumber"] || [type isEqualToString:@"NSDecimalNumber"] || [type isEqualToString:@"NSDate"] ||
        [type isEqualToString:@"NSURL"]) {
        return YES;
    }
    return NO;
}

- (NSString *)propertyTypeStringOfProperty:(objc_property_t) property
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
            NSString *name = [[NSString alloc] initWithBytes:attribute + 1 length:strlen(attribute) - 1 encoding:NSASCIIStringEncoding];
            return name;
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // it's an ObjC id type:
            return @"id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // it's another ObjC object type:
            NSString *name = [[NSString alloc] initWithBytes:attribute + 3 length:strlen(attribute) - 4 encoding:NSASCIIStringEncoding];
            return name;
        }
    }
    return nil;
}

/*
- (NSString *)propertyTypeStringOfProperty:(objc_property_t) property {
    const char *attr = property_getAttributes(property);
    NSString *const attributes = [NSString stringWithCString:attr encoding:NSUTF8StringEncoding];
    fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
    
    NSRange const typeRangeStart = [attributes rangeOfString:@"T@\""];  // start of type string
    if (typeRangeStart.location != NSNotFound) { // Type is not
        NSString *const typeStringWithQuote = [attributes substringFromIndex:typeRangeStart.location + typeRangeStart.length];
        NSRange const typeRangeEnd = [typeStringWithQuote rangeOfString:@"\""]; // end of type string
        if (typeRangeEnd.location != NSNotFound) {
            NSString *const typeString = [typeStringWithQuote substringToIndex:typeRangeEnd.location];
            return typeString;
        }
    }else if(){
        
    }
    else
    {
        NSRange const scalarTypeRangeStart = [attributes rangeOfString:@"T"];
        NSString *const scalarTypeString = [attributes substringFromIndex:scalarTypeRangeStart.location + typeRangeStart.length + 1];
        NSRange const scalarTypeRangeEnd = [scalarTypeString rangeOfString:@","]; // end of type string
        NSString *const scalarType = [scalarTypeString substringToIndex:scalarTypeRangeEnd.location];
        return scalarType;
    }
    return nil;
}
*/
@end

//
//  CPropertyReference.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPropertyReference.h"
#import "CEntityFactory.h"

@implementation CPropertyReference

- (id)initWithExpression:(NSString *)expression
{
    self = [super init];
    if (self) {
        NSArray *list = (NSMutableArray*)[expression componentsSeparatedByString:@"."];
        
        _format = [list[0] substringToIndex:1];
        _word   = [list[0] substringFromIndex:1];
        
        NSRange range;
        range.location = 1;
        range.length = list.count - 1;
        
        _propertyList = [list subarrayWithRange:range];
    }
    
    return self;
}

- (void)deserialize:(TBXMLElement *)element
{
    
    NSString *expression = [TBXML textForElement:element];
    NSArray *list = (NSMutableArray*)[expression componentsSeparatedByString:@"."];
    
    _format = [list[0] substringToIndex:1];
    _word   = [list[0] substringFromIndex:1];
    
    NSRange range;
    range.location = 1;
    range.length = list.count - 1;
    
    _propertyList = [list subarrayWithRange:range];
}

- (id)getPropertyWithEntity:(CEntity *)owner
{
    if ([_format isEqual: @"@"]) //Component Lookup
    {
        id element = [owner getComponentWithName:_word];
        for (int i=0; i < _propertyList.count; ++i) {
            element = [element valueForKey:_propertyList[i]];
            //element = [element valueForKeyPath:_propertyList[i]];
        }
        
        return element;
        
    }else if ([_format isEqualToString:@"#"]) //Global Entity Lookup
    {
        
        CEntityFactory *factory = [CEntityFactory shared];
        id element = [factory getEntity:_word];
        id component = [element getComponent:_propertyList[0]];
        for (int i=1; i < _propertyList.count; ++i) {
            component = [component valueForKey:_propertyList[i]];
            //element = [element valueForKeyPath:_propertyList[i]];
        }
        
        return element;
        
    }else if ([_format isEqualToString:@"$"]) //Global Entity Lookup
    {
        
        NSDictionary *systems = [CEngine shared].systems;
        id system = systems[_word];
        for (int i=0; i < _propertyList.count; ++i) {
            system = [system valueForKey:_propertyList[i]];
            //element = [element valueForKeyPath:_propertyList[i]];
        }
        
        return system;
    }
    
    /*
    else if ([_format isEqualToString:@"!"]) //XML Lookup
    {
        //
    }
    */
    return nil;
}

@end

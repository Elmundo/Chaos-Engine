//
//  CPropertyReference.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPropertyReference.h"

@implementation CPropertyReference

- (id)init
{
    self = [super init];
    if (self) {
        //
    }
    
    return self;
}

- (void)deserialize:(TBXMLElement *)element
{
    NSString *expression = [TBXML textForElement:element];
    _format = [expression substringToIndex:1];
    _word   = [expression substringFromIndex:1];
}

- (id)getPropertyWithEntity:(CEntity *)owner
{
    if ([_format isEqual: @"@"]) //Component Lookup
    {
        
        id element = [owner getComponentWithName:_word];
        return element;
        
    }else if ([_format isEqualToString:@"#"]) //Global Entity Lookup
    {
        
    }else if ([_format isEqualToString:@"!"]) //XML Lookup
    {
        
    }
    
    return nil;
}

@end

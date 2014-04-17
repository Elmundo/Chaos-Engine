//
//  CXMLElement.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CXMLElement.h"

@implementation CXMLElement

- (id)initWithXml:(TBXMLElement *)element
{
    self = [super init];
    if (self) {
        self.element = element;
    }
    
    return self;
}

@end

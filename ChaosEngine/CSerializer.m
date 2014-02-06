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
- (TBXML *)serialize:(id)object
{
    return nil;
}

// Deserializes an object from an TBXML description.
- (id)deserialize:(TBXML *)xml
{
    
    
    return nil;
}

@end

//
//  CEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEvent.h"

@implementation CEvent

+ (id)eventWithType:(NSString *)type
{
    CEvent *event = [[CEvent alloc] initWithType:type];
    return event;
}

- (id)initWithType:(NSString *)type
{
    self = [super init];
    if (self) {
        _type    = type;
    }
    
    return self;
}

@end

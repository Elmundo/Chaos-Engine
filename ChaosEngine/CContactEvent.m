//
//  CContactEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/6/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CContactEvent.h"

@implementation CContactEvent

+ (id)eventWithType:(NSString *)type
{
    CContactEvent *event = [[CContactEvent alloc] initWithType:type];
    return event;
}

- (id)initWithType:(NSString *)type
{
    self = [super initWithType:type];
    if (self) {

    }
    
    return self;
}

/* Event Static Messages */
+ (NSString *)CE_Contact { return @"Contact"; }

@end

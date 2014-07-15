//
//  CPositionEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPositionEvent.h"

@implementation CPositionEvent

+ (id)eventWithType:(NSString *)type
{
    CPositionEvent *event = [[CPositionEvent alloc] initWithType:type];
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
+ (NSString *)CE_PositionChanged { return @"CPositionEvent_PositionChanged"; }

@end

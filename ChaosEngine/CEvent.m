//
//  CEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEvent.h"

@implementation CEvent

+ (id)eventWithType:(NSString *)type withObject:(id)object withBubbles:(BOOL)bubbles
{
    CEvent *event = [[CEvent alloc] initWithType:type withObject:object withBubbles:bubbles];
    return event;
}

- (id)initWithType:(NSString *)type withObject:(id)object withBubbles:(BOOL)bubbles
{
    self = [super init];
    if (self) {
        _type    = type;
        _bubbles = bubbles;
        _object  = object;
    }
    
    return self;
}

/* Event Static Messages */
+ (NSString *)CE_Base { return @"CEvent_Base"; }

@end

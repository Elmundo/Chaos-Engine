//
//  CTouchEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/21/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CTouchEvent.h"

@implementation CTouchEvent

+ (id)eventWithType:(NSString *)type withObject:(id)object withEvent:(id)theEvent withBubbles:(BOOL)bubbles
{
    CTouchEvent *event = [[CTouchEvent alloc] initWithType:type withObject:object withEvent:(id)theEvent withBubbles:bubbles];
    return event;
}

- (id)initWithType:(NSString *)type withObject:(id)object withEvent:(id)theEvent withBubbles:(BOOL)bubbles
{
    self = [super initWithType:type withObject:object withBubbles:bubbles];
    if (self) {
        _event = theEvent;
    }
    
    return self;
}

/* Event Static Messages */
+ (NSString*)ETouchBegan{ return @"TouchBeganEvent"; }
+ (NSString*)ETouchMoved{ return @"TouchMovedEvent"; }
+ (NSString*)ETouchEnded{ return @"TouchEndedEvent"; }
+ (NSString*)ETouchCancelled{ return @"TouchEndedCancelled"; }

@end

//
//  CContactEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/6/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CContactEvent.h"

@implementation CContactEvent

/* Event Static Messages */
+ (NSString *)CE_Contact { return @"Contact"; }
+ (id)eventWithType:(NSString *)type withObject:(id)object withAtlas:(id)atlas withBubbles:(BOOL)bubbles
{
    CContactEvent *event = [[CContactEvent alloc] initWithType:type withObject:object withAtlas:atlas withBubbles:bubbles];
    return event;
}

- (id)initWithType:(NSString *)type withObject:(id)object withAtlas:(id)atlas withBubbles:(BOOL)bubbles
{
    self = [super initWithType:type withObject:object withBubbles:bubbles];
    if (self) {
        self.physicContact = object;
    }
    
    return self;
}
@end

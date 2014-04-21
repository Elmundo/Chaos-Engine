//
//  CTouchEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/21/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEvent.h"

@interface CTouchEvent : CEvent

@property (nonatomic, strong) id event;

+ (id)eventWithType:(NSString *)type withObject:(id)object withEvent:(id)theEvent withBubbles:(BOOL)bubbles;
- (id)initWithType:(NSString *)type withObject:(id)object withEvent:(id)event withBubbles:(BOOL)bubbles;

/* Event Static Messages */
+ (NSString*)ETouchBegan;
+ (NSString*)ETouchMoved;
+ (NSString*)ETouchEnded;
+ (NSString*)ETouchCancelled;

@end

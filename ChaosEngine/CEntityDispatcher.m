//
//  CEntityDispatcher.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEntityDispatcher.h"

@implementation CEntityDispatcher

@synthesize observers = _observers;

- (id)init
{
    self = [super init];
    if (self) {
        _observers = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)addEventListener:(SEL)action withEvent:(NSString *)message
{
    NSMutableArray *message_observers;
    if (![_observers objectForKey:message]) {
         message_observers = [[NSMutableArray alloc] init];
        [_observers setValue:message_observers forKey:message];
    }
    
    message_observers = [_observers objectForKey:message];
    NSValue *value = [NSValue valueWithPointer:action];
    [message_observers addObject:value];
}

- (void)removeEventListener:(SEL)action withEvent:(NSString *)message
{
    NSMutableArray *message_observers;
    if (![_observers objectForKey:message]) {
        return;
    }
    
    message_observers = [_observers objectForKey:message];
    
    NSValue *actionValue = [NSValue valueWithPointer:action];
    for (NSValue *selector in message_observers) {
        if ([selector isEqualToValue:actionValue]) {
            [message_observers removeObject:selector];
        }
    }
}

- (void)dispatchEvent:(CEvent *)event
{
    
}

@end

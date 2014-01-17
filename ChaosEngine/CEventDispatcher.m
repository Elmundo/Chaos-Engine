//
//  CEntityDispatcher.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEventDispatcher.h"

@implementation CEventDispatcher

@synthesize observers = _observers;

- (id)init
{
    self = [super init];
    if (self) {
        _observers = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)addEventListener:(id)target withAction:(SEL)action withEvent:(NSString *)message
{
    NSMutableArray *message_observers;
    if (![_observers objectForKey:message]) {
         message_observers = [[NSMutableArray alloc] init];
        [_observers setValue:message_observers forKey:message];
    }
    
    message_observers = [_observers objectForKey:message];
    
    CEventListener *listener = [CEventListener eventListenerWithTarget:target andAction:action];
    [message_observers addObject:listener];
}

- (void)removeEventListener:(id)target withAction:(SEL)action withEvent:(NSString *)message
{
    NSMutableArray *message_observers;
    if (![_observers objectForKey:message]) {
        return;
    }
    
    message_observers = [_observers objectForKey:message];
    CEventListener *listener;
    for (listener in message_observers) {
        if (listener.target == target) {
            [message_observers removeObject:listener.target];
        }
    }
}

- (void)dispatchEvent:(CEvent *)event
{
    if (![_observers objectForKey:event.type]) {
        return;
    }
    
    NSArray *message_observers = [_observers objectForKey:event.type];
    CEventListener *listener;
    for (listener in message_observers) {
        id target = listener.target;
        SEL action = listener.action;
        
        if ([target respondsToSelector:action]) {
            [target performSelector:action withObject:event];
        }else{
            [CLogger logWithTarget:self method:@"dispatchEvent:" message:@"Target does not have specified action."];
        }
        
    }
    
}

@end

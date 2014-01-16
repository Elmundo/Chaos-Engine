//
//  CEntityListener.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/16/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEventListener.h"

@implementation CEventListener

+ (CEventListener *)eventListenerWithTarget:(id)target andAction:(SEL)action
{
    CEventListener *listener = [[CEventListener alloc] initWithTarget:target andAction:action];
    return listener;
}

- (id)initWithTarget:(id)target andAction:(SEL)action
{
    self = [super init];
    if (self) {
        _target = target;
        _action = action;
    }
    
    return self;
}

@end

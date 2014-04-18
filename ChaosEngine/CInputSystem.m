//
//  CInputSystem.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CInputSystem.h"
#import "CEngine.h"
#import "CControllerComponent.h"

@implementation CInputSystem

+ (id)shared
{
    static CInputSystem *instance = nil;
    if (instance == nil) {
        instance = [[CInputSystem alloc] init];
        instance.systemType = kEngineSystemTypeInput;
    }
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _listeners = [NSMutableArray arrayWithCapacity:10];
        _dispatcher = [[CEventDispatcher alloc] init];
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CEvent *cEvent = [CEvent eventWithType:[CEvent ETouchBegan] withObject:event withBubbles:NO];
    [_dispatcher dispatchEvent:cEvent];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CEvent *cEvent = [CEvent eventWithType:[CEvent ETouchMoved] withObject:event withBubbles:NO];
    [_dispatcher dispatchEvent:cEvent];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CEvent *cEvent = [CEvent eventWithType:[CEvent ETouchEnded] withObject:event withBubbles:NO];
    [_dispatcher dispatchEvent:cEvent];
}

- (void)addEventListener:(id)object withAction:(SEL)action withEvent:(NSString *)message
{
    [_dispatcher addEventListener:object withAction:action withEvent:message];
}

- (void)removeEventListener:(id)object withAction:(SEL)action withEvent:(NSString *)message
{
    [_dispatcher removeEventListener:object withAction:action withEvent:message];
}

@end

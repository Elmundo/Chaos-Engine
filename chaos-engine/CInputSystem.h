//
//  CInputSystem.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"
#import "CEventDispatcher.h"

@class CControllerComponent;
@class CEventDispatcher;
@class CEventListener;

/*
    Listen to all touch events which are not handled by responder
    CSpriteNode get its own touches and handles itself.
    This class is also used for 'BROADCAST' event delivery chain.
*/
@interface CInputSystem : CEngineSystem

@property (nonatomic, strong) NSMutableArray *listeners;
@property (nonatomic, strong) CEventDispatcher *dispatcher;

+ (id)shared;

- (void)addEventListener:(id)object withAction:(SEL)action withEvent:(NSString *)message;
- (void)removeEventListener:(id)object withAction:(SEL)action withEvent:(NSString *)message;

@end

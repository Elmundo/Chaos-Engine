//
//  CEntityDispatcher.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEventListener.h"
#import "CEvent.h"

@interface CEventDispatcher : NSObject

@property (nonatomic, strong) NSMutableDictionary *observers;

- (void)addEventListener:(id)target withAction:(SEL)action withEvent:(NSString *)message;

- (void)removeEventListener:(id)target withAction:(SEL)action withEvent:(NSString *)message;

- (void)dispatchEvent:(CEvent *)event;

@end

//
//  CEntityDispatcher.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEvent.h"

@interface CEntityDispatcher : NSObject

@property (nonatomic, strong) NSMutableDictionary *observers;

- (void)addEventListener:(SEL)action withEvent:(NSString *)message;

- (void)removeEventListener:(SEL)action withEvent:(NSString *)message;

- (void)dispatchEvent:(CEvent *)event;

@end

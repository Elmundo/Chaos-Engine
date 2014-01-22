//
//  CEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CEvent : NSObject

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) id object;
@property (nonatomic, assign) BOOL bubbles;

+ (id)eventWithType:(NSString *)type withObject:(id)object withBubbles:(BOOL)bubbles;
- (id)initWithType:(NSString *)type withObject:(id)object withBubbles:(BOOL)bubbles;

/* Event Static Messages */
+ (NSString *)CE_Base;

@end

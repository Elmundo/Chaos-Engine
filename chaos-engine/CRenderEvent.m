//
//  CRenderEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRenderEvent.h"

@implementation CRenderEvent

+ (id)eventWithType:(NSString *)type
{
    CRenderEvent *event = [[CRenderEvent alloc] initWithType:type];
    return event;
}

- (id)initWithType:(NSString *)type
{
    self = [super initWithType:type];
    if (self) {

    }
    
    return self;
}

/* Event Static Messages */
+ (NSString *)CE_SpriteReady { return @"SpriteIsReady"; }

@end

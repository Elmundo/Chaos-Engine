//
//  CRenderEvent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRenderEvent.h"

@implementation CRenderEvent

/* Event Static Messages */
+ (NSString *)CE_SpriteReady { return @"SpriteIsReady"; }
+ (id)eventWithType:(NSString *)type withObject:(id)object withAtlas:(id)atlas withSprite:(id)sprite withBubbles:(BOOL)bubbles
{
    CRenderEvent *event = [[CRenderEvent alloc] initWithType:type withObject:object  withAtlas:atlas withSprite:sprite withBubbles:bubbles];
    return event;
}

- (id)initWithType:(NSString *)type withObject:(id)object withAtlas:(id)atlas withSprite:(id)sprite withBubbles:(BOOL)bubbles
{
    self = [super initWithType:type withObject:object withBubbles:bubbles];
    if (self) {
        self.atlas = atlas;
        self.sprite = sprite;
    }
    
    return self;
}
@end

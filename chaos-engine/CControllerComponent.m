//
//  CControllerComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CControllerComponent.h"


@implementation CControllerComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    [self addEventListener:@selector(onTouchBegan:)     message:[CTouchEvent ETouchBegan]];
    [self addEventListener:@selector(onTouchMoved:)     message:[CTouchEvent ETouchMoved]];
    [self addEventListener:@selector(onTouchEnded:)     message:[CTouchEvent ETouchEnded]];
    [self addEventListener:@selector(onTouchCancelled:) message:[CTouchEvent ETouchCancelled]];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self removeEventListener:@selector(onTouchBegan:)     message:[CTouchEvent ETouchBegan]];
    [self removeEventListener:@selector(onTouchMoved:)     message:[CTouchEvent ETouchMoved]];
    [self removeEventListener:@selector(onTouchEnded:)     message:[CTouchEvent ETouchEnded]];
    [self removeEventListener:@selector(onTouchCancelled:) message:[CTouchEvent ETouchCancelled]];
}

- (void)update:(NSTimeInterval)dt
{
    // Override this method
}

/* Event Listener Methods*/
- (void)onTouchBegan:(CTouchEvent *)event
{
    // Override this method
}

- (void)onTouchMoved:(CTouchEvent *)event
{
    // Override this method
}

- (void)onTouchEnded:(CTouchEvent *)event
{
    // Override this method
}

- (void)onTouchCancelled:(CTouchEvent *)event
{
    // Override this method
}

@end

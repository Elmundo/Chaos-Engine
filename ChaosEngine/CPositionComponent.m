//
//  CPositionComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPositionComponent.h"

@implementation CPositionComponent

@synthesize position = _position;

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    CPositionEvent *event = [CPositionEvent eventWithType:[CPositionEvent CE_PositionChanged] withObject:self withBubbles:YES];
    [self dispatchEventWithEvent:event];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    _position = nil;
}

- (void)setPoint:(float)x and:(float)y
{
    _position.x = x;
    _position.y = y;
    CPositionEvent *event = [CPositionEvent eventWithType:[CPositionEvent CE_PositionChanged] withObject:_position withBubbles:YES];
    [self dispatchEventWithEvent:event];
}

- (void)setWithCGPoint:(CGPoint)point
{
    [self setPoint:point.x and:point.y];
}

#pragma mark GETTER & SETTER
- (CPoint *)position { return _position; }
- (void)setPosition:(CPoint *)position { _position = position; }

@end

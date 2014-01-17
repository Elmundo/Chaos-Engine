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
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

- (void)setPoint:(int)x and:(int)y
{
    _position.x = x;
    _position.y = y;
   
    CPositionEvent *event = [CPositionEvent eventWithType:[CPositionEvent CE_PositionChanged] withBubbles:NO];
    [self dispatchEventWithEvent:event];
}

- (void)setWithCGPoint:(CGPoint)point
{
    _position.x = point.x;
    _position.y = point.y;
    
    [self setPoint:point.x and:point.y];
}

#pragma mark GETTER & SETTER
- (CPoint *)position { return _position; }
- (void)setPosition:(CPoint *)position {
    _position = position;
}

@end

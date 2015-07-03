//
//  CPositionComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPositionComponent.h"

@implementation CPositionComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    CPositionEvent *event = [CPositionEvent eventWithType:[CPositionEvent CE_PositionChanged]];
    event.position = _position;
    
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
    CPositionEvent *event = [CPositionEvent eventWithType:[CPositionEvent CE_PositionChanged]];
    event.position = _position;
    
    [self dispatchEventWithEvent:event];
}

- (void)setWithCGPoint:(CGPoint)point
{
    [self setPoint:point.x and:point.y];
}

@end

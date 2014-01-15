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
    
    self.notificationManager = [NSNotificationCenter defaultCenter];
    
    [self addEventListener:@selector(testMethod:) message:@"Event"];
    [self removeEventListener:@selector(testMethod:) message:@"Event"];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

- (void)setPoint:(int)x and:(int)y
{
    _position.x = x;
    _position.y = y;
   
    [self.notificationManager postNotificationName:@"EventPositionUpdated" object:nil];
}

- (void)setWithCGPoint:(CGPoint)point
{
    _position.x = point.x;
    _position.y = point.y;
    
    [self setPoint:point.x and:point.y];
}

- (void)testMethod:(CEvent *)event
{
    
}

#pragma mark GETTER & SETTER

- (CPoint *)position { return _position; }
- (void)setPosition:(CPoint *)position {
    _position = position;
}

@end

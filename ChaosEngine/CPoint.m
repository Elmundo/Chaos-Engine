//
//  CPoint.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPoint.h"

@implementation CPoint

- (id)initWithX:(int)x and:(int)y
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
    }
    
    return  self;
}

- (id)initWithCGPoint:(CGPoint)point
{
    self = [super init];
    if (self) {
        _x = point.x;
        _y = point.y;
    }
    
    return  self;
}

- (CGPoint)CGPoint
{
    return CGPointMake(_x, _y);
}

#pragma mark GETTER & SETTER


@end

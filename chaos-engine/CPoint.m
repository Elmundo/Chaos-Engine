//
//  CPoint.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPoint.h"

@implementation CPoint

- (id)init
{
    self = [super init];
    if (self) {
        _x = 0.0f;
        _y = 0.0f;
    }
    
    return self;
}

- (id)initWithX:(float)x and:(float)y
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
- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"x"])
    {
        _x = [value floatValue];
    }else if ([key isEqualToString:@"y"])
    {
        _y = [value floatValue];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    // No needed for now
}

@end

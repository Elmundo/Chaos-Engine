//
//  CUtil.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CUtil.h"

@implementation CUtil

+ (CGPoint)transformPoint:(CGPoint)position
{
    CGPoint top_bottom_oriented_position;
    
    top_bottom_oriented_position.x = position.x;
    top_bottom_oriented_position.y = [UIScreen mainScreen].bounds.size.height - position.y;
    
    return top_bottom_oriented_position;
}

+ (CGRect)eulerToUnit:(CGRect)euler andResourceSize:(CGSize)sourceSize
{
    Float32 unitX      = euler.origin.x / sourceSize.width;
    Float32 unitY      = euler.origin.y / sourceSize.height;
    Float32 unitWidth  = euler.size.width / sourceSize.width;
    Float32 unitHeight = euler.size.height / sourceSize.height;
    
    // This line arithmetic operations for OpenGL Coordinate system.
    // In the current system origin(0,0) is Bottom-Left but we want it to behave
    // as origin(0,0) is Top-Left of the screen. So made this changes to build out magic.
    // We make extra manipulation only for Y axes.
    unitY = 1.0 - (unitY + unitHeight);
    
    CGRect unitCoordFrame = CGRectMake(unitX,
                                       unitY,
                                       unitWidth,
                                       unitHeight);
    return unitCoordFrame;
}

+ (CGFloat)angleToRadian:(CGFloat)value
{
    CGFloat radian = kPI * (value / 180.0f);
    
    return radian;
}

+ (CGFloat)radianToAngle:(CGFloat)value
{
    CGFloat angle = 180 * (value / kPI);
    
    return angle;
}
@end

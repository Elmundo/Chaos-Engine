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

@end

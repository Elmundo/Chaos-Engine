//
//  CPoint.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//
@import CoreGraphics;
#import <Foundation/Foundation.h>

@interface CPoint : NSObject

@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;

- (id)initWithX:(float)x and:(float)y;
- (id)initWithCGPoint:(CGPoint)point;
- (CGPoint)CGPoint;

@end

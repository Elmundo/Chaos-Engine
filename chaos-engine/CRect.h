//
//  CRect.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/29/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//
@import CoreGraphics;
#import <Foundation/Foundation.h>
#import "CSerializable.h"

@interface CRect : CSerializable

@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;
@property (nonatomic, assign) int width;
@property (nonatomic, assign) int height;

- (id)initWithX:(int)x y:(int)y width:(int)width height:(int)height;
- (id)initWithRect:(CRect *)rect;
- (id)initWithCGRect:(CGRect)rect;

@end

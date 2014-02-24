//
//  CPoint.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSerializable.h"

@interface CPoint : NSObject

@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;

- (id)initWithX:(int)x and:(int)y;

- (id)initWithCGPoint:(CGPoint)point;

- (CGPoint)CGPoint;

@end

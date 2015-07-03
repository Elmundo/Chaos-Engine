//
//  CPositionComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CUtil.h"
#import "CPoint.h"
#import "CPositionEvent.h"

@interface CPositionComponent : CComponent

@property (nonatomic, strong) CPoint *position; // Required

- (void)setPoint:(float)x and:(float)y;
- (void)setWithCGPoint:(CGPoint)point;

@end

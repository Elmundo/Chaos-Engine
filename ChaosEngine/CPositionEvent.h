//
//  CPositionEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEvent.h"
#import "CPoint.h"

@interface CPositionEvent : CEvent

@property(nonatomic, strong) CPoint *position;

/* Event Static Messages */
+ (NSString *)CE_PositionChanged;

@end

//
//  CPositionEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEvent.h"

enum kPosition {
    kPositionInit = 0,
    kPositionChanged = 1,
};

@interface CPositionEvent : CEvent

/* Event Static Messages */
+ (NSString *)CE_PositionChanged;

@end

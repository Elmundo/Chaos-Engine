//
//  CControllerComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CTouchEvent.h"

@interface CControllerComponent : CComponent

/* Event Listener Methods*/
- (void)onTouchBegan:(CTouchEvent *)event;

- (void)onTouchMoved:(CTouchEvent *)event;

- (void)onTouchEnded:(CTouchEvent *)event;

- (void)onTouchCancelled:(CTouchEvent *)event;

@end

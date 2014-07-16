//
//  GuduComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 04/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CPropertyReference.h"
#import "GamepadComponent.h"

@interface GuduComponent : CComponent

/* OUTTER PROPERTIES*/
@property (nonatomic, strong) CPropertyReference *gamepadProperty;
@property (nonatomic, strong) CPropertyReference *positionProperty;
@property (nonatomic, strong) CPropertyReference *cameraProperty;

/* INNER PROPERTIES*/
@property (nonatomic, assign) CGVector speedVector;
@property (nonatomic, assign) CGVector jumpVector;
@property (nonatomic, assign) NSInteger direction;
@property (nonatomic, assign) bool isJumping;
@property (nonatomic, weak) GamepadComponent *gamepad;
@property (nonatomic, weak) CPositionComponent *position;
@end

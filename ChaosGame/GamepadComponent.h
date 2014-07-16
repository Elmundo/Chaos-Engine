//
//  GamepadComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 11/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CControllerComponent.h"
#import "CSpriteNode.h"
#import "CSceneManager.h"
#import "CLayer.h"
#import "CPositionComponent.h"
#import "CEntityFactory.h"

typedef enum : NSUInteger {
    kGamepadLeft = 0,
    kGamepadRight,
    kGamepadJump,
} kGamepad;

@interface GamepadComponent : CControllerComponent

@property (nonatomic, strong) NSString *layerName;
@property (nonatomic, assign) BOOL *keys;

@property (nonatomic, strong) CSpriteNode *leftButton;
@property (nonatomic, strong) CSpriteNode *rightButton;
@property (nonatomic, strong) CSpriteNode *jumpButton;

@end

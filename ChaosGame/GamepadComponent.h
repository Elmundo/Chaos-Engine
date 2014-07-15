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

@interface GamepadComponent : CControllerComponent
{
    BOOL _isTouched;
}
@property (nonatomic, strong) NSString *layerName;


@property NSInteger direction;
@property NSInteger jumpValue;
@property NSInteger jumpSpeed;
@property BOOL isJumping;

@property (nonatomic, strong) CPositionComponent *position;
@property (nonatomic, strong) CSpriteNode *leftButton;
@property (nonatomic, strong) CSpriteNode *rightButton;
@property (nonatomic, strong) CSpriteNode *jumpButton;

@end

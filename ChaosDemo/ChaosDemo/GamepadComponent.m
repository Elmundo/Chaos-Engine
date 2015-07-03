//
//  GamepadComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 11/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "GamepadComponent.h"

@implementation GamepadComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    CLayer *uiLayer = [[CSceneManager shared] getLayerWithName:_layerName];
    
    _leftButton = [CSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(64, 64)];
    _leftButton.position = CGPointMake(50, 50);
    _leftButton.alpha = 0.5;
    [_leftButton setUserInteractionEnabled:YES];
    _leftButton.name = @"LeftButton";
    _leftButton.owner = owner;
    
    _rightButton = [CSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(64, 64)];
    _rightButton.position = CGPointMake(130, 50);
    _rightButton.alpha = 0.5;
    _rightButton.name = @"RightButton";
    _rightButton.owner = owner;
    [_rightButton setUserInteractionEnabled:YES];
    
    _jumpButton = [CSpriteNode spriteNodeWithColor:[UIColor yellowColor] size:CGSizeMake(64, 64)];
    _jumpButton.position = CGPointMake(400, 50);
    _jumpButton.alpha = 0.5;
    _jumpButton.name = @"JumpButton";
    _jumpButton.owner = owner;
    [_jumpButton setUserInteractionEnabled:YES];

    [uiLayer addChild:_leftButton];
    [uiLayer addChild:_rightButton];
    [uiLayer addChild:_jumpButton];
    [uiLayer setUserInteractionEnabled:YES];
    
    _keys = malloc(sizeof(int)*3);
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

/* Event Listener Methods*/
- (void)onTouchBegan:(CTouchEvent *)event
{
    
    for (int i=0; i < event.touches.count; ++i) {
        
        CSpriteNode *node = event.spriteNode;
        if (node == _leftButton) {
            _keys[kGamepadLeft] = true;
        }else if (node == _rightButton){
            _keys[kGamepadRight] = true;
        }

        if (node == _jumpButton){
            _keys[kGamepadJump] = true;
            clog(@"Jump is true");
        }
    }
}

- (void)onTouchEnded:(CTouchEvent *)event
{
    for (int i=0; i < event.touches.count; ++i) {
        
        CSpriteNode *node = event.spriteNode;
        if (node == _leftButton) {
            _keys[kGamepadLeft] = false;
        }else if (node == _rightButton){
            _keys[kGamepadRight] = false;
        }
        
        if (node == _jumpButton){
            _keys[kGamepadJump] = false;
            clog(@"Jump is false");
        }
    }
}

@end

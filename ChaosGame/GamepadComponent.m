//
//  GamepadComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 11/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "GamepadComponent.h"

#define JUMP_TIME 26

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
    
    CEntity *entity = [[CEntityFactory shared] getEntity:@"Gudu"];
    _position = (CPositionComponent *)[entity getComponentWithName:@"Position"];
    _isTouched = FALSE;
    
    _direction = 1;
    _jumpValue = JUMP_TIME;
    _isJumping = false;
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

- (void)update:(NSTimeInterval)dt
{
    if (_isTouched) {
        [_position setPoint:_position.position.x+_direction and:_position.position.y];
    }
    
    if (_isJumping) {
        
        [_position setPoint:_position.position.x and:_position.position.y+_jumpValue*0.100];
        _jumpValue--;
        if (_jumpValue == -JUMP_TIME) {
            _isJumping = false;
            _jumpValue = JUMP_TIME;
        }

    }
    
}

/* Event Listener Methods*/
- (void)onTouchBegan:(CTouchEvent *)event
{
    
    for (int i=0; i < event.touches.count; ++i) {
        UITouch *touch = [event.touches objectAtIndex:i];
        CSpriteNode *node = event.spriteNode;
        if (node == _leftButton) {
            
            _direction = -1;
            _isTouched = true;
            
        }else if (node == _rightButton){
            
            _direction = 1;
            _isTouched = true;
            
        }
        
        if (_isJumping == false && node == _jumpButton){
            
            _isJumping = true;
        }

    }
    
    
}

- (void)onTouchMoved:(CTouchEvent *)event
{
    _isTouched = false;
}

- (void)onTouchEnded:(CTouchEvent *)event
{
    _isTouched = false;
}

- (void)onTouchCancelled:(CTouchEvent *)event
{
    _isTouched = false;
}

@end

//
//  GuduComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 04/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "GuduComponent.h"

typedef enum : NSUInteger {
    kDirectionLeft = -1,
    kDirectionRight = 1,
} kDirection;

#define JUMP_VALUE 50

@implementation GuduComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _gamepad = [_gamepadProperty getPropertyWithEntity:nil];
    _position = [_positionProperty getPropertyWithEntity:owner];
    
    _speedVector = CGVectorMake(2, 0);
    _jumpVector = CGVectorMake(0, JUMP_VALUE);
    _direction = kDirectionRight;
    _isJumping = false;
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

- (void)update:(NSTimeInterval)dt
{
    if (_gamepad.keys[kGamepadLeft]) {
        
        [_position setPoint:_position.position.x-_speedVector.dx and:_position.position.y];
        
    }else if (_gamepad.keys[kGamepadRight]){
        [_position setPoint:_position.position.x+_speedVector.dx and:_position.position.y];
    }
    
    if (_gamepad.keys[kGamepadJump]) {
        _isJumping = true;
        
    }
    
    if (_isJumping) {
        if (_jumpVector.dy < -JUMP_VALUE) {
            _isJumping = false;
            _jumpVector.dy = JUMP_VALUE;
        }else{
            [_position setPoint:_position.position.x and:_position.position.y+_jumpVector.dy*0.075];
            _jumpVector.dy--;
        }
    }
}

@end

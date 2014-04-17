//
//  CControllerComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CControllerComponent.h"
#import "CInputSystem.h"

@implementation CControllerComponent

static BOOL firstTouch = FALSE;

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _inputManager = [CInputSystem shared];
    [_inputManager addController:self];
    
    _pos = (CPositionComponent*)[self getComponent:@"Position"];
    
    _tappedScreen = FALSE;
    _vertSpeed = 0;
    _jumpSpeed = 300.f ;
    _fallingConstant = 1000.f ;

}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [_inputManager removeController:self];
    _inputManager = nil;
    _renderRef = nil;
    _positionRef = nil;
    _pos = nil;
}

- (void)update:(NSTimeInterval)dt
{
    if (firstTouch) {
        if (_tappedScreen) {
            _vertSpeed = _jumpSpeed;
            _tappedScreen = NO;
        }
        
        float posY = _pos.position.y + (_vertSpeed * dt);
        [_pos setPoint:_pos.position.x and:posY];
        
        _vertSpeed -= (_fallingConstant * dt);
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!firstTouch) {
        firstTouch = YES;
        CAnimationComponent *animation = (CAnimationComponent*)[self getComponent:@"CAnimationComponent"];
        [animation playAnimationWithName:@"Fly"];
    }
    
    _tappedScreen = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

@end

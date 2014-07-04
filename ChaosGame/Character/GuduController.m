//
//  GuduController.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 04/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "GuduController.h"

@implementation GuduController

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _camera = [_cameraProperty getPropertyWithEntity:nil];
    _positionComponent = [_positionProperty getPropertyWithEntity:owner];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

-  (void)onTouchBegan:(CTouchEvent *)event
{
    _isTouching = true;
}

- (void)onTouchCancelled:(CTouchEvent *)event
{
    _isTouching = false;
}

- (void)onTouchEnded:(CTouchEvent *)event
{
    _isTouching = false;
}

- (void)onTouchMoved:(CTouchEvent *)event
{
}

- (void)update:(NSTimeInterval)dt
{
    if (_isTouching) {
        [_camera moveCameraWithX:1 andY:0];
        [_positionComponent setPoint:_positionComponent.position.x+1 and:_positionComponent.position.y];
    }
}

@end

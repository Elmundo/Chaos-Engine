//
//  GuduController.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 04/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CControllerComponent.h"
#import "CPropertyReference.h"
#import "CCameraComponent.h"
#import "CPositionComponent.h"

@interface GuduController : CControllerComponent
{
    BOOL _isTouching;
}

@property (nonatomic, strong) CPropertyReference *cameraProperty;
@property (nonatomic, strong) CPropertyReference *positionProperty;

@property (nonatomic, strong) CCameraComponent *camera;
@property (nonatomic, strong) CPositionComponent *positionComponent;

@end

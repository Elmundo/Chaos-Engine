//
//  MyScene.h
//  ChaosGame
//

//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CScene.h"

#import "CEntityFactory.h"
#import "CComponent.h"
#import "CPhysicComponent.h"
#import "CPositionComponent.h"
#import "CRenderComponent.h"

@interface MyScene : CScene 
{
    CPositionComponent *positionComponent;
}
@end

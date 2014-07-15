//
//  MyScene.h
//  ChaosGame
//

//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CScene.h"

#import "CEntityFactory.h"
#import "CPositionComponent.h"
#import "CRendererComponent.h"
#import "CAnimationComponent.h"

#import "CControllerComponent.h"
#import "CLayer.h"
#import "CTemplateManager.h"
#import "CPhysicComponent.h"

/*in Game Part*/
#import "GameLayer.h"

@interface MyScene : CScene
{
    CLayer *gameLayer;
    CLayer *uiLayer;
}

@end

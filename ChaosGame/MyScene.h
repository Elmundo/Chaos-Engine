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
#import "CRenderComponent.h"
#import "CAnimationComponent.h"
#import "CControllerComponent.h"
#import "CBirdComponent.h"
#import "CPipeComponent.h"
#import "CControllerComponent.h"
#import "CLayer.h"
#import "CTemplateManager.h"
#import "CPhysicComponent.h"

/*in Game Part*/
#import "CBackgroundComponent.h"
#import "PipeSpawnerSystem.h"

static const uint32_t pipeCategory   =  0x1 << 0;
static const uint32_t birdCategory   =  0x1 << 1;
static const uint32_t groundCategory =  0x1 << 2;

@interface MyScene : CScene
{
    CLayer *birdLayer;
    CLayer *groundLayer;
    CLayer *pipeLayer;
    CLayer *bgLayer;
}
@end

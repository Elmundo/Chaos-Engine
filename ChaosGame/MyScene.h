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

/*in Game Part*/
#import "CBackgroundComponent.h"
#import "PipeSpawnerSystem.h"
#import "BirdLayer.h"
#import "GroundLayer.h"
#import "PipeLayer.h"
#import "BGLayer.h"

@interface MyScene : CScene 
{
    BirdLayer     *birdLayer;
    GroundLayer *groundLayer;
    PipeLayer     *pipeLayer;
    BGLayer         *bgLayer;
}
@end

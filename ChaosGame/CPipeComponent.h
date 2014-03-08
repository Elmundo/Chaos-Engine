//
//  CPipeComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import <SpriteKit/SpriteKit.h>
#import "CUtil.h"
#import "CRenderEvent.h"
#import "CSceneManager.h"

/*Dependency Time*/
#import "CPositionComponent.h"
#import "CRenderComponent.h"

typedef NS_ENUM(NSInteger, kPipeDireciton)
{
    kPipeDirecitonTop = 0,
    kPipeDirecitonDown = 1,
};

@interface CPipeComponent : CComponent

@property (nonatomic, strong) NSString *sceneName; // Outside

@property (nonatomic, weak) CScene *scene;
@property (nonatomic, weak) SKSpriteNode *pipeSprite;
@property (nonatomic, weak) CPositionComponent *pos;
@property (nonatomic, weak) CRenderComponent *render;

@property (nonatomic, assign) int pipeHeight;
@property (nonatomic, assign) int pipeDirection;
@property (nonatomic, assign) CGRect unitCenterRect;

@property (nonatomic, assign) CGVector speed;

@end

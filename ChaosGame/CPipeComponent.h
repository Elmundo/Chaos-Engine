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

typedef NS_ENUM(NSInteger, kPipeDireciton)
{
    kPipeDirecitonTop = 0,
    kPipeDirecitonDown = 1,
};

@interface CPipeComponent : CComponent

@property (nonatomic, strong) NSString *sceneName; // Outside

@property (nonatomic, weak) CScene *scene;
@property (nonatomic, strong) SKSpriteNode *innerPipeSprite;
@property (nonatomic, assign) int pipeInnerHeight;
@property (nonatomic, assign) int pipeDirection;
@property (nonatomic, assign) CGRect unitCenterRect;

@end

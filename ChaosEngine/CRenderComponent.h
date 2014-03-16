//
//  CRenderComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CScene.h"
#import "CSceneManager.h"
#import "CPositionComponent.h"
#import "CPoint.h"
#import "CPositionEvent.h" 
#import "CTextureAtlas.h"
#import "CRenderEvent.h"
#import "CSize.h"
#import "CLayer.h"
#import <SpriteKit/SpriteKit.h>

@interface CRenderComponent : CComponent

@property (nonatomic, weak) CSceneManager *manager;
@property (nonatomic, weak) CScene *scene;
@property (nonatomic, weak) CLayer *layer;
@property (nonatomic, weak) CPoint *position;
@property (nonatomic, weak) id positionRef;

@property (nonatomic, strong) NSString *sceneName; // Outside
@property (nonatomic, strong) NSString *layerName; //
@property (nonatomic, strong) NSString *resourceName; // Outside
@property (nonatomic, strong) NSString *atlasName; // Outside
@property (nonatomic, strong) CSize *textureSize; // Outside
@property (nonatomic, strong) CPoint *anchorPoint; // Outside
@property (nonatomic, assign) CGFloat rotateValue; // Outside
@property (nonatomic, assign) CGFloat scaleFactor; // Outside

@property (nonatomic, strong) SKSpriteNode *spriteNode;
@property (nonatomic, strong) SKTexture *sourceTexture;
@property (nonatomic, strong) CTextureAtlas *atlas;

@end

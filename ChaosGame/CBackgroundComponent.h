//
//  CBackgroundComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/24/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CScene.h"
#import "CPoint.h"
#import "CSceneManager.h"
#import "CRenderEvent.h"
#import "CLayer.h"
#import <SpriteKit/SpriteKit.h>

@interface CBackgroundComponent : CComponent

@property (nonatomic, weak) CSceneManager *manager;

@property (nonatomic, strong) id positionRef; // Outside
@property (nonatomic, strong) id renderRef; // Outside

@property (nonatomic, strong) CLayer *layer;
@property (nonatomic, strong) SKSpriteNode *sprite;
@property (nonatomic, strong) NSString *sceneName;
@property (nonatomic, strong) CScene *scene;
@property (nonatomic, strong) CPoint *position;

/*Scroll Slide Sprite*/
@property (nonatomic, strong) SKSpriteNode *groundSprite1;
@property (nonatomic, strong) SKSpriteNode *groundSprite2;
@property (nonatomic, strong) SKTexture    *groundTexture;

@property (nonatomic, assign) CGVector speed;
@end

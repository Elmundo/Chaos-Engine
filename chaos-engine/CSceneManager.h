//
//  CSceneManager.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEngineSystem.h"
#import "CScene.h"

@class CLayer;

@protocol CSceneManager <NSObject>

- (CScene *)getSceneWithName:(NSString *)sceneName;

@end

@interface CSceneManager : CEngineSystem

@property (nonatomic, strong) SKView *rootView;
@property (nonatomic, strong) NSMutableDictionary *sceneDic;
@property (nonatomic, assign) BOOL isAnySceneActive;
@property (nonatomic, strong) CScene *activeScene;

- (void)addScene:(CScene *)scene;
- (CScene *)createSceneWithName:(NSString *)sceneName;
- (CScene *)getSceneWithName:(NSString *)sceneName;

- (NSDictionary *)getScenes;
- (CLayer *)getLayerWithName:(NSString *)layerName;

+ (CSceneManager *)shared;

@end

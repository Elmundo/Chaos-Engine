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

@interface CSceneManager : CEngineSystem

@property (nonatomic, strong) SKView *rootView;
@property (nonatomic, strong) NSMutableDictionary *sceneDic;
@property (nonatomic, assign) BOOL isAnySceneActive;

- (void)addScene:(CScene *)scene;
- (CScene *)createSceneWithName:(NSString *)sceneName;
- (CScene *)getSceneWithName:(NSString *)sceneName;

- (NSDictionary *)getScenes;

+ (CSceneManager *)shared;

@end

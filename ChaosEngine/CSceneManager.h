//
//  CSceneManager.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CScene.h"

@interface CSceneManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *sceneDic;

- (void)addScene:(CScene *)scene;
- (CScene *)createSceneWithName:(NSString *)sceneName;
- (CScene *)getSceneWithName:(NSString *)sceneName;

- (NSDictionary *)getScenes;

+ (id)shared;

@end

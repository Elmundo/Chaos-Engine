//
//  CEngine.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSceneManager.h"

typedef NS_ENUM(int, EngineSystemType) {
    kEngineSystemTypeUpdate = 0,
    kEngineSystemTypeInput
};

@interface CEngine : NSObject<CSceneDelegate>

@property (nonatomic, strong) NSMutableDictionary *systems;

+ (CEngine *)shared;
+ (CEngine *)initChaosEngine;

- (void)addSystem:(CEngineSystem *)system;
- (void)removeSystem:(CEngineSystem *)system;

@end

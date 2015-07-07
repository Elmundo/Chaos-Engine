//
//  CEngine.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "CSceneManager.h"

typedef NS_ENUM(int, EngineSystemType) {
    kEngineSystemTypeUpdate = 0,
    kEngineSystemTypeInput = 1,
    KEngineSystemTypePhysic = 2,
};

@interface CEngine : NSObject<CSceneDelegate>
{
    NSTimer *_timer;
}
@property (nonatomic, strong) NSMutableDictionary *systems;

@property (nonatomic, assign) NSTimeInterval systemTime;
@property (nonatomic, assign) NSTimeInterval prevTime;
@property (nonatomic, assign) NSTimeInterval elapsedTime;
@property (nonatomic, assign) CGSize screenSize;
@property (nonatomic, assign) CGFloat widthHalf;
@property (nonatomic, assign) CGFloat heightHalf;

+ (CEngine *)shared;
+ (CEngine *)initChaosEngine;

- (void)addSystem:(CEngineSystem *)system;
- (void)removeSystem:(CEngineSystem *)system;
- (CEngineSystem *)getSystem:(NSString *)name;
- (void)setScreenSize:(CGSize)screenSize;

@end

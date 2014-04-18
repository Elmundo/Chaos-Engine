//
//  CEngineSystem.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@class CEngine;

@interface CEngineSystem : NSObject

@property (nonatomic, weak) CEngine *engine;
@property (nonatomic, assign) int systemType;
@property (nonatomic, strong) NSString *name;

- (void)update:(NSTimeInterval)dt;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)didBeginContact:(SKPhysicsContact *)contact;
- (void)didEndContact:(SKPhysicsContact *)contact;

@end

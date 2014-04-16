//
//  CPhysicSystem.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"

@class CPhysicComponent;

@interface CPhysicSystem : CEngineSystem<SKPhysicsContactDelegate>

@property (nonatomic, strong) NSMutableArray *components;

+ (id)shared;

-  (void)didBeginContact:(SKPhysicsContact *)contact;
- (void)didEndContact:(SKPhysicsContact *)contact;

- (void)add:(CPhysicComponent *)collider;
- (void)remove:(CPhysicComponent *)collider;

@end

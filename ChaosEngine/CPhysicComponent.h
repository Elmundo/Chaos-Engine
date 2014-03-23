//
//  CPhysicComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CRenderComponent.h"
#import <SpriteKit/SpriteKit.h>

@class CPhysicSystem;

@interface CPhysicComponent : CComponent

@property (nonatomic, weak) CPhysicSystem *physicManager;

@property (nonatomic, assign) uint32_t category;
@property (nonatomic, assign) uint32_t collision;
@property (nonatomic, assign) uint32_t contact;

@property (nonatomic, strong) SKPhysicsBody *physicBody;
@property (nonatomic, strong) CRenderComponent *render;

@end

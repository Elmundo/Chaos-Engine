//
//  CPhysicComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CRendererComponent.h"
#import <SpriteKit/SpriteKit.h>

@class CPhysicSystem;
@class CContactEvent;

@interface CPhysicComponent : CComponent

@property (nonatomic, weak) CPhysicSystem *physicManager;

/* OUTSIDE PROPERTIES */
@property (nonatomic, assign) CGFloat mass;
@property (nonatomic, assign) CGFloat friction;
@property (nonatomic, assign) CGFloat linearDamping;
@property (nonatomic, assign) CGFloat angularDamping;
@property (nonatomic, assign) CGFloat restitution;
@property (nonatomic, assign) uint32_t category;
@property (nonatomic, assign) uint32_t collision;
@property (nonatomic, assign) uint32_t contact;
@property (nonatomic, assign) bool dynamic;
@property (nonatomic, assign) bool affectedByGravity;
@property (nonatomic, assign) bool allowsRotation;

@property (nonatomic, strong) CSize *volumeSize;
@property (nonatomic, strong) CPoint *volumeAnchorPoint;

/* INNER PROPERTIES */
@property (nonatomic, strong) SKPhysicsBody *physicBody;
@property (nonatomic, strong) CRendererComponent *render;
@property (nonatomic, strong) CSpriteNode *volumeSprite;

- (void)didBeginContact:(SKPhysicsContact *)contact;
- (void)didEndContact:(SKPhysicsContact *)contact;

@end

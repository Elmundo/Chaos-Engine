//
//  CPhysicComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPhysicComponent.h"
#import "CPhysicSystem.h"
#import "CContactEvent.h"

@implementation CPhysicComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _physicManager = [CPhysicSystem shared];
    [_physicManager add:self];
    
    _render = (CRendererComponent *)[self getComponent:@"Render"];
    CGSize physicObjectSize = CGSizeMake(self.render.spriteNode.size.width, self.render.spriteNode.size.height);
    
    _render.spriteNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:physicObjectSize];
    _volumeSprite = [[CSpriteNode alloc] initWithColor:[UIColor redColor] size:physicObjectSize];
    _volumeSprite.anchorPoint = _render.spriteNode.anchorPoint;
    _volumeSprite.alpha = 0.5f;
    [_render.spriteNode addChild:_volumeSprite];
    
    _physicBody = _render.spriteNode.physicsBody;
    
    // How to reacts to forces and collisions
    _physicBody.mass            = _mass;
    _physicBody.friction        = _friction;
    _physicBody.linearDamping   = _linearDamping;
    _physicBody.angularDamping  = _angularDamping;
    _physicBody.restitution     = _restitution;
    
    // How the simulation is performed on the body itself
    _physicBody.dynamic           = _dynamic;
    _physicBody.affectedByGravity = _affectedByGravity;
    _physicBody.allowsRotation    = _allowsRotation;
    
    // Mask categories
    _physicBody.categoryBitMask     = 0x1;//_category;
    _physicBody.collisionBitMask    = 0x1;//_collision;
    _physicBody.contactTestBitMask  = 0x1;//_contact;
    
    [self addEventListener:@selector(didBeginContact:) message:[CContactEvent CE_Contact]];
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self removeEventListener:@selector(didBeginContact:) message:[CContactEvent CE_Contact]];
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    // Override this method
}

- (void)didEndContact:(SKPhysicsContact *)contact
{
    // Override this method
}


// GETTER & SETTER
-(BOOL)isDynamic
{
    return _dynamic;
}

-(void)setDynamic:(bool)dynamic
{
    self.render.spriteNode.physicsBody.dynamic = dynamic;
    _dynamic = dynamic;
}

@end

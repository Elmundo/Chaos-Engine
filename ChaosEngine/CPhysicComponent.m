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
    
    self.render = (CRenderComponent *)[self getComponent:@"CRenderComponent"];
    
    self.render.spriteNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.render.spriteNode.size.width, self.render.spriteNode.size.height)];
    
    self.physicBody = self.render.spriteNode.physicsBody;
    
    // How to reacts to forces and collisions
    self.physicBody.mass = 0.0f;
    self.physicBody.friction = 0.0f;
    self.physicBody.linearDamping = 0.0f;
    self.physicBody.angularDamping = 0.0f;
    self.physicBody.restitution = 0.0f;
    
    // How the simulation is performed on the body itself
    self.physicBody.dynamic = self.dynamic;
    self.physicBody.affectedByGravity = NO;
    self.physicBody.allowsRotation = NO;
    
    self.physicBody.categoryBitMask = self.category;
    self.physicBody.collisionBitMask = self.collision;
    self.physicBody.contactTestBitMask = self.contact;
    
    [self addEventListener:@selector(didBeginContact:) message:[CContactEvent CE_Contact]];
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self removeEventListener:@selector(didBeginContact:) message:[CContactEvent CE_Contact]];
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{

}

- (void)didEndContact:(SKPhysicsContact *)contact
{
    //
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

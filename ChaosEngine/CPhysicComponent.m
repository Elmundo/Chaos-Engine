//
//  CPhysicComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPhysicComponent.h"
#import "CPhysicSystem.h"

@implementation CPhysicComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _physicManager = [CPhysicSystem shared];
    [_physicManager add:self];
    
    self.render = (CRenderComponent *)[self getComponent:@"CRenderComponent"];
    
    self.render.spriteNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 100)];
    self.render.spriteNode.physicsBody.dynamic = YES;
    
    self.render.spriteNode.physicsBody.categoryBitMask = self.category;
    self.render.spriteNode.physicsBody.collisionBitMask = self.collision;
    self.render.spriteNode.physicsBody.contactTestBitMask = self.contact;
    

}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{

}

- (void)didEndContact:(SKPhysicsContact *)contact
{
 
}

@end

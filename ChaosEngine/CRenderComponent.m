//
//  CRenderComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRenderComponent.h"

@implementation CRenderComponent

@synthesize position = _position;

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    self.manager = [CSceneManager shared];
    self.notificationManager = [NSNotificationCenter defaultCenter];
    self.spriteNode.anchorPoint = CGPointMake(0.5, 0.5);
    
    [self.notificationManager addObserver:self selector:@selector(didPositionUpdated) name:@"EventPositionUpdated" object:nil];
    
    if (self.resourceName == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:@"resourceName is nil."];
        return;
    }
    
    self.spriteNode = [SKSpriteNode spriteNodeWithImageNamed:self.resourceName];
    if (self.spriteNode == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a resource", self.resourceName)];
        return;
    }
    
    self.scene      = [self.manager getSceneWithName:self.sceneName];
    if (self.spriteNode == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a scene", self.sceneName)];
    }
    /*
    // This block code shall be changed
    // CRenderComponent should not need to know CPositionComponent.
    // Just need to know a generic variable that could bring the CPoint data with a given SEL object
    
    CPositionComponent *component = (CPositionComponent *)[self getComponent:@"CPositionComponent"];
    self.position = component.position;
    self.spriteNode.position = [self.position CGPoint];
    */
    self.position = (CPoint *)self.positionRef;
    self.spriteNode.position = [self.position CGPoint];
    
    [self.scene addChild:self.spriteNode];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self.notificationManager removeObserver:self name:@"EventPositionUpdated" object:nil];
}

- (void)didPositionUpdated
{
    self.spriteNode.position = [self.position CGPoint];
}

#pragma mark GETTER & SETTER

@end

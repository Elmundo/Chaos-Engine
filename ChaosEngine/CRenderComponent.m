//
//  CRenderComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRenderComponent.h"

@implementation CRenderComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    self.manager = [CSceneManager shared];
    
    if (self.resourceName == nil) {
        [[CLogger shared] errorWithTarget:self method:@"didAddedToEntity"
                                  message:@"resourceName is nil."];
        return;
    }
    
    self.spriteNode = [SKSpriteNode spriteNodeWithImageNamed:self.resourceName];
    if (self.spriteNode == nil) {
        [[CLogger shared] errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a resource", self.resourceName)];
        return;
    }
    
    self.scene      = [self.manager getSceneWithName:self.sceneName];
    if (self.spriteNode == nil) {
        [[CLogger shared] errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a scene", self.sceneName)];
    }
    
    CPositionComponent *component = (CPositionComponent *)[self getComponent:@"CPositionComponent"];
    self.position = [component getPosition];
    self.spriteNode.position = self.position;
    
    [self.scene addChild:self.spriteNode];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

@end

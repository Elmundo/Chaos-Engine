//
//  CAnimationComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CAnimationComponent.h"

@implementation CAnimationComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    self.spriteNode   = self.renderRef;
    self.textureAtlas = self.atlasRef;
    
    [self addEventListener:@selector(did_sprite_ready:) message:@"SpriteIsReady"]; //TODO Refactor this - no more hard-coded.
}

- (void)playAnimationWithName:(NSString *)animationName
{
    if (!self.spriteNode) {
        self.spriteNode = self.renderRef;
    }
    
    NSArray *animationList = [_textureAtlas animationWithName:animationName];
    if (!animationList) {
        return;
    }
    
    SKAction *actionAnimation = [SKAction animateWithTextures:animationList timePerFrame:kDefaultTimePerFrame resize:YES restore:NO];
    SKAction *repeatAction = [SKAction repeatActionForever:actionAnimation];
    
    [self.spriteNode runAction:repeatAction];
}

- (void)did_sprite_ready:(CEvent *)event
{
    self.renderRef = event.object;
    self.atlasRef  = [event performSelector:NSSelectorFromString(@"atlas")];
    
    self.spriteNode   = self.renderRef;
    self.textureAtlas = self.atlasRef;
}

- (void)didRemovedFromEntity
{
    [self didRemovedFromEntity];
}

@end

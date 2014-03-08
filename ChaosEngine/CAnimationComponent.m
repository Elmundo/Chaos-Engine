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
    
    self.spriteNode   = (SKSpriteNode*)[self.rendererComponent performSelector:NSSelectorFromString(@"spriteNode")];
    self.textureAtlas = (CTextureAtlas*)[self.rendererComponent performSelector:NSSelectorFromString(@"atlas")];
    
    [self addEventListener:@selector(did_sprite_ready:) message:[CRenderEvent CE_SpriteReady]]; //TODO Refactor this - no more hard-coded.
}

- (void)playAnimationWithName:(NSString *)animationName
{
    if (!self.spriteNode) {
        @throw @"playAnimationWithName method: self.spriteNode is nil.";
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
    self.spriteNode   = event.object;
    self.textureAtlas = [event performSelector:NSSelectorFromString(@"atlas")];;
}

- (void)didRemovedFromEntity
{
    [self didRemovedFromEntity];
}

@end

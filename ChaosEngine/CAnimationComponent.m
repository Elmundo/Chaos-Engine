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
    
    _renderComponent = [owner getProperty:self.renderProperty];
    _spriteNode   = (SKSpriteNode*)[self.renderComponent performSelector:NSSelectorFromString(@"spriteNode")];
    _textureAtlas = (CTextureAtlas*)[self.renderComponent performSelector:NSSelectorFromString(@"atlas")];
    
    [self addEventListener:@selector(did_sprite_ready:) message:[CRenderEvent CE_SpriteReady]]; //TODO Refactor this - no more hard-coded.
}

- (void)playAnimationWithName:(NSString *)animationName
{
    if (!_spriteNode) {
        @throw @"playAnimationWithName method: self.spriteNode is nil.";
    }
    
    NSArray *animationList = [_textureAtlas animationWithName:animationName];
    if (!animationList) {
        return;
    }
    
    SKAction *actionAnimation = [SKAction animateWithTextures:animationList timePerFrame:kDefaultTimePerFrame resize:YES restore:NO];
    SKAction *repeatAction = [SKAction repeatActionForever:actionAnimation];
    
    [_spriteNode runAction:repeatAction];
}

- (void)did_sprite_ready:(CEvent *)event
{
    _spriteNode   = event.object;
    _textureAtlas = [event performSelector:NSSelectorFromString(@"atlas")];
}

- (void)didRemovedFromEntity
{
    [self didRemovedFromEntity];
    
    [_spriteNode removeAllActions];
    _spriteNode = nil;
    _textureAtlas = nil;
    
}

@end

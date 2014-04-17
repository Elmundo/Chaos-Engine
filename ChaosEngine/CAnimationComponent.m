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
    
    _spriteNode   = [owner getProperty:_spriteProperty];
    _textureAtlas = [owner getProperty:_atlasProperty];
    
    [self addEventListener:@selector(did_sprite_ready:) message:[CRenderEvent CE_SpriteReady]];
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

- (void)did_sprite_ready:(CRenderEvent *)event
{
    _spriteNode   = event.object;
    _textureAtlas = event.atlas;
}

- (void)didRemovedFromEntity
{
    [self didRemovedFromEntity];
    
    [_spriteNode removeAllActions];
    _spriteNode   = nil;
    _textureAtlas = nil;
}

@end

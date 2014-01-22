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
    
    _animationDic = [NSMutableDictionary dictionary];
    if (self.renderRef) {
        SKSpriteNode *sprite = self.renderRef;
        SKTexture *texture   = sprite.texture;
        
        _textureAtlas = [CTextureAtlas atlasWithXmlName:_atlasName andWithResource:texture];
    }
    
    [self addEventListener:@selector(did_sprite_ready:) message:@"SpriteIsReady"]; //TODO Refactor this - no more hard-coded.
}

- (void)playAnimationWithName:(NSString *)animationName
{
    __block SKSpriteNode *sprite = self.renderRef;
    NSArray *animationList = [_textureAtlas animationWithName:animationName];
    
    SKAction *actionAnimation = [SKAction animateWithTextures:animationList timePerFrame:kDefaultTimePerFrame resize:YES restore:NO];
    SKAction *repeatAction = [SKAction repeatActionForever:actionAnimation];
    
    [sprite runAction:repeatAction];
}

- (void)did_sprite_ready:(CEvent *)event
{
    self.renderRef = event.object;
    
    SKSpriteNode *sprite = self.renderRef;
    SKTexture *texture   = sprite.texture;
    
    _textureAtlas = [CTextureAtlas atlasWithXmlName:_atlasName andWithResource:texture];
}

- (void)didRemovedFromEntity
{
    [self didRemovedFromEntity];
}

@end

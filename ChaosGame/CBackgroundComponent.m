//
//  CBackgroundComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/24/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CBackgroundComponent.h"

@implementation CBackgroundComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    self.manager  = [CSceneManager shared];
    self.scene    = [self.manager getSceneWithName:self.sceneName];
    
    self.speed = CGVectorMake(-120.0f, 0.0f);
    
    [self addEventListener:@selector(render_init:) message:[CRenderEvent CE_SpriteReady]];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

-(void)update:(NSTimeInterval)dt
{
    
    if (!self.groundSprite1 || !self.groundSprite2)
        return;
    
    if (self.groundSprite1.position.x <= -320) {
        self.groundSprite1.position = CGPointMake(320, self.groundSprite1.position.y);
        self.groundSprite2.position = CGPointMake(0, self.groundSprite1.position.y);
    }else if (self.groundSprite2.position.x <= -320) {
        self.groundSprite2.position = CGPointMake(320, self.groundSprite1.position.y);
        self.groundSprite1.position = CGPointMake(0, self.groundSprite1.position.y);
    }
    
    self.groundSprite1.position = CGPointMake(_groundSprite1.position.x + (_speed.dx * dt),
                                              _groundSprite1.position.y);
    
    self.groundSprite2.position = CGPointMake(_groundSprite2.position.x + (_speed.dx * dt),
                                              _groundSprite2.position.y);
    
    
}

-(void)render_init:(CRenderEvent *)event
{
    self.groundTexture = [SKTexture textureWithImageNamed:@"ground.png"];
    
    CGSize size = CGSizeMake(320, 98);
    
    CGPoint position1 = CGPointMake(0, 0);
    CGPoint position2 = CGPointMake(320, 0);
    
    self.groundSprite1 = [SKSpriteNode spriteNodeWithTexture:self.groundTexture size:size];
    self.groundSprite1.anchorPoint = CGPointMake(0.0f, 0.0f);
    self.groundSprite1.position = position1;
    
    self.groundSprite2 = [SKSpriteNode spriteNodeWithTexture:self.groundTexture size:size];
    self.groundSprite2.anchorPoint = CGPointMake(0.0f, 0.0f);
    self.groundSprite2.position = position2;
    
    [self.scene addChild:self.groundSprite1];
    [self.scene addChild:self.groundSprite2];
    
    self.position = (CPoint *)self.positionRef;
    self.sprite   = (SKSpriteNode *)event.object;
}

@end

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
    
    self.speed = CGVectorMake(-4.0f, 0.0f);
    
    [self addEventListener:@selector(render_init:) message:[CRenderEvent CE_SpriteReady]];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

-(void)update:(NSTimeInterval)dt
{
    NSLog(@"TimeInterval: %f", dt);
    
    self.groundSprite1.position = CGPointMake(self.groundSprite1.position.x + self.speed.dx,
                                              self.groundSprite1.position.y + self.speed.dy);
    
    self.groundSprite2.position = CGPointMake(self.groundSprite2.position.x + self.speed.dx,
                                              self.groundSprite2.position.y + self.speed.dy);
    
    if (self.groundSprite1.position.x <= -320) {
        self.groundSprite1.position = CGPointMake(320, self.groundSprite1.position.y);
        self.groundSprite2.position = CGPointMake(0, self.groundSprite1.position.y);
    }else if (self.groundSprite2.position.x <= -320) {
        self.groundSprite2.position = CGPointMake(320, self.groundSprite1.position.y);
        self.groundSprite1.position = CGPointMake(0, self.groundSprite1.position.y);
    }
}

-(void)render_init:(CRenderEvent *)event
{
    self.groundTexture = [SKTexture textureWithImageNamed:@"ground.png"];
    
    CGSize size = CGSizeMake(320, 98);
    
    CGPoint position1 = CGPointMake(0, -382);
    CGPoint position2 = CGPointMake(320, -382);
    
    self.groundSprite1 = [SKSpriteNode spriteNodeWithTexture:self.groundTexture size:size];
    self.groundSprite1.anchorPoint = CGPointMake(0.0f, 1.0f);
    self.groundSprite1.position = position1;
    
    self.groundSprite2 = [SKSpriteNode spriteNodeWithTexture:self.groundTexture size:size];
    self.groundSprite2.anchorPoint = CGPointMake(0.0f, 1.0f);
    self.groundSprite2.position = position2;
    
    [self.scene addChild:self.groundSprite1];
    [self.scene addChild:self.groundSprite2];
    
    self.position = (CPoint *)self.positionRef;
    self.sprite   = (SKSpriteNode *)event.sprite;
}

@end

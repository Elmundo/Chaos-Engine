//
//  CRenderComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRenderComponent.h"

@implementation CRenderComponent

#define kDefaultRenderAnchorPoint CGPointMake(0.0f, 0.0f)

@synthesize position = _position;

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    self.manager = [CSceneManager shared];
    
    if (self.resourceName == nil) {
        clog(@"resourceName property is nil.");
        return;
    }
    
    self.sourceTexture = [SKTexture textureWithImageNamed:self.resourceName];
    if (self.sourceTexture == nil) {
        clog(@"There is no such a resource: %@", self.resourceName);
        return;
    }
    
    if (self.atlasName == nil) {
        clog(@"atlasName property is nil.");
        
    }else{
        self.atlas = [CTextureAtlas atlasWithXmlName:self.atlasName andWithResource:self.sourceTexture];
        if (self.atlas == nil) {
            clog(@"There is no such a atlas: %@", self.atlasName);
            return;
        }
    }
    
    SKTexture *defaultTexture;
    if (self.atlas) // If there is an texture atlas, then get first texture of it.
        defaultTexture = [self.atlas getFirstTexture];
    else // If not, get the whole source resource as texture.
        defaultTexture = self.sourceTexture;
    
    /* If texture size is given, the sprite is initialized using the texture,
       but the texture’s dimensions are not used.
       Instead, the size passed into the constructor method is used. 
    */
    if (self.textureSize) {
        self.spriteNode = [SKSpriteNode spriteNodeWithTexture:defaultTexture size:[self.textureSize CGSize]];
    }
    else{
        self.spriteNode = [SKSpriteNode spriteNodeWithTexture:defaultTexture];
    }

    if (self.spriteNode == nil) {
        clog(@"There is no such a texture: %@", self.resourceName);
        return;
    }
  
    self.scene = [self.manager getSceneWithName:self.sceneName];
    if (self.spriteNode == nil) {
        clog(@"There is no such a scene: %@", self.sceneName);
    }
   
    // Init the sprite position
    self.position = (CPoint *)self.positionRef;
    
    CGPoint pos = [self.position CGPoint];
    self.spriteNode.position = pos;
    
    if (_anchorPoint)
        self.spriteNode.anchorPoint = _anchorPoint.CGPoint;
    else
        self.spriteNode.anchorPoint = kDefaultRenderAnchorPoint;
    
    if (self.rotateValue > 0) {
        self.spriteNode.zRotation = [CUtil angleToRadian:self.rotateValue];
    }
    
    if (self.scaleFactor) {
        self.spriteNode.xScale = self.spriteNode.yScale = _scaleFactor;
    }
    
    [self.scene addChild:self.spriteNode];
    [self addEventListener:@selector(did_position_updated:) message:[CPositionEvent CE_PositionChanged] ];
    CRenderEvent *event = [CRenderEvent eventWithType:[CRenderEvent CE_SpriteReady] withObject:self.spriteNode withAtlas:self.atlas withBubbles:YES];
    [self dispatchEventWithEvent:event];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self.spriteNode removeFromParent];
    [self.spriteNode removeAllChildren];
    [self removeEventListener:@selector(did_position_updated:) message:[CPositionEvent CE_PositionChanged]];
    
    self.spriteNode = nil;
    self.sceneName = nil;
    self.resourceName = nil;
    self.atlasName = nil;
    self.textureSize = nil;
    self.anchorPoint = nil;
    self.sourceTexture = nil;
    self.atlas = nil;
}

- (void)did_position_updated:(CPositionEvent *)event
{
    self.spriteNode.position = [self.position CGPoint];
}

#pragma mark GETTER & SETTER

@end

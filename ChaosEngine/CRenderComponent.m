//
//  CRenderComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRenderComponent.h"

@implementation CRenderComponent

#define kDefaultRenderAnchorPoint CGPointMake(0.0f, 1.0f)

@synthesize position = _position;

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    self.manager = [CSceneManager shared];
    
    if (self.resourceName == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:@"resourceName is nil."];
        return;
    }
    
    self.sourceTexture = [SKTexture textureWithImageNamed:self.resourceName];
    if (self.sourceTexture == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                         message:cStringWithValue(@"There is no such a resource: %@", self.resourceName)];
        return;
    }
    
    if (self.atlasName == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                         message:@"atlasName is nil."];
        
    }else{
        self.atlas = [CTextureAtlas atlasWithXmlName:self.atlasName andWithResource:self.sourceTexture];
        if (self.atlas == nil) {
            [CLogger errorWithTarget:self method:@"didAddedToEntity"
                             message:cStringWithValue(@"There is no such a atlas: %@", self.atlasName)];
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
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a texture: %@", self.resourceName)];
        return;
    }
  
    self.scene = [self.manager getSceneWithName:self.sceneName];
    if (self.spriteNode == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a scene: %@", self.sceneName)];
    }
   
    // Init the sprite position
    self.position = (CPoint *)self.positionRef;
    
    CGPoint pos = [self.position CGPoint];
    self.spriteNode.position = pos;
    self.spriteNode.anchorPoint = kDefaultRenderAnchorPoint;

    [self.scene addChild:self.spriteNode];
    [self addEventListener:@selector(did_position_updated:) message:[CPositionEvent CE_PositionChanged] ];
    CRenderEvent *event = [CRenderEvent eventWithType:@"SpriteIsReady" withObject:self.spriteNode withAtlas:self.atlas withBubbles:YES]; //TODO: Need to be changed couse hard-coded string
    [self dispatchEventWithEvent:event];
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self removeEventListener:@selector(did_position_updated:) message:[CPositionEvent CE_PositionChanged]];
}

- (void)did_position_updated:(CPositionEvent *)event
{
    self.spriteNode.position = [self.position CGPoint];
}

#pragma mark GETTER & SETTER

@end

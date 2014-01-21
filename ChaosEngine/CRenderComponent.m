//
//  CRenderComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRenderComponent.h"

@implementation CRenderComponent

#define kAnchorDefaultPointX 0.5f
#define kAnchorDefaultPointY 0.5f

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
    
    self.texture = [SKTexture textureWithImageNamed:self.resourceName];
    if (self.texture == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                         message:cStringWithValue(@"There is no such a resource", self.resourceName)];
        return;
    }
    
    self.spriteNode = [SKSpriteNode spriteNodeWithTexture:self.texture];
    if (self.spriteNode == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a texture", self.resourceName)];
        return;
    }
    
    self.scene      = [self.manager getSceneWithName:self.sceneName];
    if (self.spriteNode == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                                  message:cStringWithValue(@"There is no such a scene", self.sceneName)];
    }
   
    // Init the sprite position
    self.position = (CPoint *)self.positionRef;
    self.spriteNode.position = [self.position CGPoint];
    self.spriteNode.anchorPoint = CGPointMake(kAnchorDefaultPointX, kAnchorDefaultPointY);

    [ self.scene addChild:self.spriteNode];
    
    [self addEventListener:@selector(did_position_updated:) message:[CPositionEvent CE_PositionChanged]];
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

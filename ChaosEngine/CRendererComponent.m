//
//  CRenderComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRendererComponent.h"

@implementation CRendererComponent

#define kDefaultRenderAnchorPoint CGPointMake(0.0f, 0.0f)

@synthesize position = _position;

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    /***********************************************************************************************
        CSceneManager system generate a dependency which is strictly tied to CSceneManager class.
        Must be more flexible so developer would want to use another 3rd pary system or the system 
        which is created by himself. We need to define a new concept like in CPropertyReference
        like CComponent and CEntity that PropertyReference class will know how to handle when
        it is defined EngineSystem in xml description and get the related object from Engine itself.
     ***********************************************************************************************/
    //_manager = owner.getProperty(managerProperty);
    _manager = [CSceneManager shared]; // i wanna run away from this approach
    _layer = [_manager getLayerWithName:_layerName];
    
    if (self.resourceName == nil) {
        clog(@"resourceName property is nil.");
        return;
    }
    
    self.sourceTexture = [SKTexture textureWithImageNamed:self.resourceName];
    if (self.sourceTexture == nil) {
        clog(@"There is no such a resource: %@", self.resourceName);
        return;
    }

    [self render];
    [self setDefaultSprite:owner];
    [self setPositionAndAttributes:owner];
    
    [self addEventListener:@selector(did_position_updated:) message:[CPositionEvent CE_PositionChanged] ];
    
    CRenderEvent *event = [CRenderEvent eventWithType:[CRenderEvent CE_SpriteReady]
                                           withObject:self.spriteNode
                                          withBubbles:YES];
    [self dispatchEventWithEvent:event];
}

/* Overrideble */
- (void)render
{
    if (self.textureSize) {
        self.spriteNode = [CSpriteNode spriteNodeWithTexture:_sourceTexture size:[self.textureSize CGSize]];
    }
    else{
        _spriteNode = [CSpriteNode spriteNodeWithTexture:_sourceTexture];
    }
    
    if (_spriteNode == nil) {
        clog(@"There is no such a texture: %@", self.resourceName);
        return;
    }
    
    //Add sprite to layer, not to scene directly
    [self.layer addChild:self.spriteNode];
}

- (void)setDefaultSprite:(CEntity*)owner
{
    _spriteNode.owner = owner;
    _spriteNode.userInteractionEnabled = self.userInteractionEnabled;
}

- (void)setPositionAndAttributes:(CEntity*)owner
{
    // Init the sprite position
    _position = [owner getProperty:_positionProperty];
    
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
    
    self.spriteNode.zPosition = _zPosition;

}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self.spriteNode removeFromParent];
    [self.spriteNode removeAllChildren];
    [self removeEventListener:@selector(did_position_updated:) message:[CPositionEvent CE_PositionChanged]];
    
    self.spriteNode = nil;
    self.layerName = nil;
    self.resourceName = nil;
    self.textureSize = nil;
    self.anchorPoint = nil;
    self.sourceTexture = nil;
}

- (void)did_position_updated:(CPositionEvent *)event
{
    self.spriteNode.position = [self.position CGPoint];
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
    _userInteractionEnabled = userInteractionEnabled;
}

@end

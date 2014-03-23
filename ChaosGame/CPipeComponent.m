//
//  CPipeComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPipeComponent.h"

@implementation CPipeComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _scene = [[CSceneManager shared] getSceneWithName:_sceneName];
    _speed = CGVectorMake(-120.0f, 0.0f);
    _render = (CRenderComponent *)[self getComponent:@"CRenderComponent"];
    
    if (_render.spriteNode) {
        [self render_init:nil];
    }
    
    [self addEventListener:@selector(render_init:) message:[CRenderEvent CE_SpriteReady]];
    
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [self removeEventListener:@selector(render_init:) message:[CRenderEvent CE_SpriteReady]];
    
    _scene = nil;
    _pipeSprite = nil;
    _pos = nil;
    _render = nil;
}

-(void)update:(NSTimeInterval)dt
{
    [_pos setPoint:(_pos.position.x + (_speed.dx * dt)) and:_pos.position.y];
}

- (void)render_init:(CRenderEvent *)event
{
    self.render = (CRenderComponent*)[self getComponent:@"CRenderComponent"];
    self.pos = (CPositionComponent*)[self getComponent:@"CPositionComponent"];
    
    [self removeEventListener:@selector(render_init:) message:[CRenderEvent CE_SpriteReady]];
}

@end

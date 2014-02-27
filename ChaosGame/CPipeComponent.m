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
    _innerPipeSprite = [SKSpriteNode spriteNodeWithImageNamed:@"tube-inner.png"];
    CGRect centerRect    = CGRectMake(0, 0, 83, 1);
    _unitCenterRect  = [CUtil eulerToUnit:centerRect andResourceSize:CGSizeMake(83, 1)];
    
    [self addEventListener:@selector(render_init:) message:[CRenderEvent CE_SpriteReady]];
    
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

-(void)update:(NSTimeInterval)dt
{
    
}

- (void)render_init:(CRenderEvent *)event
{
    _innerPipeSprite = event.sprite;

    _innerPipeSprite.centerRect = _unitCenterRect;
    _innerPipeSprite.yScale = _pipeInnerHeight;
    
    [self removeEventListener:@selector(render_init:) message:[CRenderEvent CE_SpriteReady]];
}

@end

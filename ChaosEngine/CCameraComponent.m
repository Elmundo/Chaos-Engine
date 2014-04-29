//
//  CCameraComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CCameraComponent.h"

@implementation CCameraComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    
    [super didAddedToEntity:owner];
    
    _sceneManager = [owner getProperty:_sceneManagerProperty];
    if([_sceneManager respondsToSelector:@selector(getLayerWithName:)])
    {
        _cameraLayer = [_sceneManager performSelector:@selector(getLayerWithName:) withObject:_layerName];
    }
    
    CSpriteNode *interface = [CSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(480, 320)];
    interface.userInteractionEnabled = YES;
    interface.anchorPoint = CGPointMake(0, 0);
    interface.alpha = 0.5f;
    
    [_cameraLayer addChild:interface];
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
}

@end

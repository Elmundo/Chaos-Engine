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
    
    _layers = [[NSMutableArray alloc] init];
    _sceneManager = [CSceneManager shared];
    
    for (NSString *layerName in _layerNameList) {
        
        CLayer *layer = [_sceneManager getLayerWithName:layerName];
        [_layers addObject:layer];
    }
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [_layers removeAllObjects];
    _sceneManager = nil;
    _layers = nil;
}

- (void)moveCameraWithX:(int)x andY:(int)y
{
    for (CLayer *layer in _layers) {
        layer.position = CGPointMake(layer.position.x - x, layer.position.y - y);
    }
}

- (void)setCameraPositionWithX:(int)x andY:(int)y
{
    for (CLayer *layer in _layers) {
        layer.position = CGPointMake(x, y);
    }
}

@end

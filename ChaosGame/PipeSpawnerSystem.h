//
//  PipeSpawnerSystem.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/8/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"
#import "CPositionComponent.h"
#import "CRenderComponent.h"
#import "CPipeComponent.h"
#import "CEntity.h"
#import "CEntityFactory.h"
#import "CLayer.h"
#import "CPhysicComponent.h"

@interface PipeSpawnerSystem : CEngineSystem
{
    NSMutableArray *_pipeList;
    CLayer *_layer;
    CGFloat _spawnInterval; //in sec
    CGFloat _elapsedTime; //in sec;
    
    CGFloat _bottomYPos;
    CGFloat _topYPos;
}

- (id)initWithLayer:(CLayer *)layer;

@end

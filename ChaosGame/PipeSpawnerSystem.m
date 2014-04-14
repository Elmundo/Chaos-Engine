//
//  PipeSpawnerSystem.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/8/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "PipeSpawnerSystem.h"

#define kMinGap 148.0;
#define kMaxGap 380.0;

@implementation PipeSpawnerSystem

- (id)init
{
    self = [super init];
    if (self) {
        _elapsedTime = 0.0;
        _spawnInterval = 1.0;
        
        _pipeList = [NSMutableArray array];
    }
    
    return self;
}

- (void)update:(NSTimeInterval)dt
{
    // Some Stuff
    _elapsedTime += dt;
    if (_elapsedTime >= _spawnInterval) {
        _elapsedTime = _elapsedTime - _spawnInterval;
        
        float gap = [self calculateGapYPos:dt];
        
        /* Bottom pipe */
        _bottomYPos = gap;

        /* Top pipe */
        float x = gap + 183 + 100;
        _topYPos = 183 + x;
        
        [self spawnPipes];
    }
    
    for (int i = 0; i < _pipeList.count; ++i) {
        CEntity *entity = _pipeList[i];
        CPositionComponent *pos = (CPositionComponent*)[entity getComponentWithName:@"CPositionComponent"];
        if(pos.position.x <= 0)
        {
            [entity destroy];
            [_pipeList removeObject:entity];
        }
    }
}

- (CGFloat)calculateGapYPos:(NSTimeInterval)dt
{
    float gapY = (arc4random() % 90) + 10;
    return gapY;
}

- (void)spawnPipes
{
    [self createPipeBottom];
    [self createPipeTop];
}

/* Create pipe entity */
- (void)createPipeBottom
{
    CEntity *pipeEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:400.0 and:_bottomYPos];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = @"MyScene";
    rendererComponent.resourceName = @"tube.png";
    rendererComponent.positionRef = positionComponent.position;
    
    CPipeComponent *pipeComponent = [[CPipeComponent alloc] init];
    pipeComponent.sceneName = NSStringFromClass([self class]);
    
    [pipeEntity addComponent:positionComponent];
    [pipeEntity addComponent:rendererComponent];
    [pipeEntity addComponent:pipeComponent];
    
    [pipeEntity initialize:@"pipeBottom"];
    
    [_pipeList addObject:pipeEntity];
}

- (void)createPipeTop
{
    CEntity *pipeEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:423.0f and:_topYPos];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = @"MyScene";
    rendererComponent.resourceName = @"tube.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.rotateValue = 180.0f;
    rendererComponent.anchorPoint = [[CPoint alloc] initWithX:0.5f and:0.0f];
    
    CPipeComponent *pipeComponent = [[CPipeComponent alloc] init];
    pipeComponent.sceneName = NSStringFromClass([self class]);
    
    [pipeEntity addComponent:positionComponent];
    [pipeEntity addComponent:rendererComponent];
    [pipeEntity addComponent:pipeComponent];
    
    [pipeEntity initialize:@"pipeTop"];
    
    [_pipeList addObject:pipeEntity];
}

@end

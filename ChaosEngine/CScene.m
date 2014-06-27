//
//  CScene.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CScene.h"

#define kDefaultSceneAnchorPoint CGPointMake(0.0f, 0.0f)

@implementation CScene

-(id)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.contentCreated = NO;
        self.sceneName = NSStringFromClass([self class]);
        self.anchorPoint = kDefaultSceneAnchorPoint;
        //Physic
        self.physicsWorld.contactDelegate = [CPhysicSystem shared];
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        _layers = [NSMutableArray array];
    }
    
    return self;
}

// Overrided method
-(void)addChild:(SKNode *)node
{
    [super addChild:node];
    [_layers addObject:node];
}

-(void)removeChild:(SKNode *)node
{
    [node removeFromParent];
    [_layers removeObject:node];
}

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

/* Override this method in subclass */
- (void)createSceneContents
{
    
}

/* Called before each frame is rendered */
-(void)update:(CFTimeInterval)currentTime
{
    [self.delegate update:currentTime];
}

/* Called when user make some touch inputs */
/*
    CEngine will not handle event dispatching system for now.
    touchesBegan method will not be callad and CInputSystem is disabled for now.
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    clog(@"Scene touch method is called.");
    //[self.delegate touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.delegate touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.delegate touchesMoved:touches withEvent:event];
}


@end

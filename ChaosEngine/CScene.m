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
        self.scaleMode = SKSceneScaleModeAspectFill;
        
        /* Read in the Property list */
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"plist"];
        _config = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
        NSDictionary *gravityDic = [_config objectForKey:@"Gravity"];
        CGVector gravity = CGVectorMake([[gravityDic objectForKey:@"X"] floatValue], [[gravityDic objectForKey:@"Y"] floatValue]);
        
        //TODO: Physic -> This assignment should be implemented in CSceneManager, scene must not know the CPhysicSystem
        self.physicsWorld.contactDelegate = [CPhysicSystem shared];
        self.physicsWorld.gravity = gravity;
        
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
        
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        _panGesture.delegate = self;
        _panGesture.delaysTouchesBegan = (BOOL)[_config objectForKey:@"DelaysTouchesBegan"];
        //[self.view addGestureRecognizer:_panGesture];
    }
}

- (void)panGesture:(UIPanGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateFailed){
        clog(@"Gesture recognizer is failed.");
    }else if (recognizer.state == UIGestureRecognizerStateBegan){
        clog(@"Gesture recognizer is began.");
    }else if (recognizer.state == UIGestureRecognizerStateRecognized){
        clog(@"Gesture recognizer is recognized.");
    }else if (recognizer.state == UIGestureRecognizerStatePossible){
        clog(@"Gesture recognizer is possible.");
    }else if (recognizer.state == UIGestureRecognizerStateCancelled){
        clog(@"Gesture recognizer is cancelled.");
    }else if (recognizer.state == UIGestureRecognizerStateEnded){
        clog(@"Gesture recognizer is ended.");
    }else if (recognizer.state == UIGestureRecognizerStateChanged){
        clog(@"Gesture recognizer is changed.");
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
    clog(@"CScene: touchesBegan");
    //[self.delegate touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    clog(@"CScene: touchesEnded");
    //[self.delegate touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    clog(@"CScene: touchesMoved");
    //[self.delegate touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    clog(@"CScene: touchesCancelled");
    //[self.delegate touchesCancelled:touches withEvent:event];
}

@end

//
//  MyScene.m
//  ChaosDemo
//
//  Created by Baris Yilmaz on 3.07.2015.
//  Copyright (c) 2015 chaos. All rights reserved.
//

#import "MyScene.h"

#import <CEntityFactory.h>
#import <CPositionComponent.h>
#import <CRendererComponent.h>
#import <CAnimationComponent.h>

#import <CControllerComponent.h>
#import <CLayer.h>
#import <CTemplateManager.h>
#import <CPhysicComponent.h>

#import "GameLayer.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.anchorPoint = CGPointMake(0.0, 0.0);
        self.backgroundColor = [SKColor blueColor];
    }
    
    return self;
}

- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    
}

- (void)createSceneContents
{
    /* DO NOT COMMENT OUT LAYERS, OR YOU SHALL SEE THE RED OF THE HELL!*/
    self.backgroundColor = [SKColor whiteColor];
    [self createLayers];
    [self createTestGame];
}

- (void)createLayers
{
    gameLayer       = [[GameLayer alloc] init];
    gameLayer.name  = @"gameLayer";
    
    uiLayer       = [[CLayer alloc] init];
    uiLayer.name  = @"uiLayer";
    
    // Add layers by considering the layer order
    [self addChild:gameLayer];
    [self addChild:uiLayer];
}

- (void)createTestGame
{
    // Load the level xml description file
    [[CTemplateManager shared] loadFile:@"gamepad_test.xml"];
    
    // Instantiate the entities which will be visible in game
    [[CTemplateManager shared] instantiateEntity:@"Gamepad"];
    [[CTemplateManager shared] instantiateEntity:@"TilemapRenderer"];
    [[CTemplateManager shared] instantiateEntity:@"Gudu"];
    [[CTemplateManager shared] instantiateEntity:@"Camera"];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
}

@end

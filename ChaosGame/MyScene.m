//
//  MyScene.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/10/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
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
    bgLayer         = [[CLayer alloc] init];
    bgLayer.name    = @"bgLayer";
    gameLayer       = [[CLayer alloc] init];
    gameLayer.name  = @"gameLayer";
    
    [self addChild:bgLayer];
    [self addChild:gameLayer];
}

- (void)createTestGame
{
    // Load the level xml description file
    [[CTemplateManager shared] loadFile:@"test_level.xml"];
    
    // Instantiate the entities which will be visible in game
    /*
    [[CTemplateManager shared] instantiateEntity:@"Background"];
    [[CTemplateManager shared] instantiateEntity:@"Character"];
    [[CTemplateManager shared] instantiateEntity:@"House"];
     */
    [[CTemplateManager shared] instantiateEntity:@"TileMapRenderer"];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
}

@end

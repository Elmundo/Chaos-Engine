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

- (void)didMoveToView:(SKView *)theView
{
    [super didMoveToView:theView];
    
    SKView *view = self.view;
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(testMethod:)];
    
    //[self.view addGestureRecognizer:_tapGesture];

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
    bgLayer = [[CLayer alloc] init];
    bgLayer.name = @"bgLayer";
    
    gameLayer       = [[GameLayer alloc] init];
    gameLayer.name  = @"gameLayer";
    
    UILayer = [[CLayer alloc] init];
    UILayer.name = @"UILayer";
    
    // Add layers by considering the layer order
    [self addChild:bgLayer];
    [self addChild:gameLayer];
    [self addChild:UILayer];
}

- (void)createTestGame
{
    // Load the level xml description file
    //[[CTemplateManager shared] loadFile:@"test_level.xml"];
    [[CTemplateManager shared] loadFile:@"animation_renderer_test.xml"];
    // Instantiate the entities which will be visible in game
    /*
    [[CTemplateManager shared] instantiateEntity:@"Background"];
    [[CTemplateManager shared] instantiateEntity:@"Character"];
    [[CTemplateManager shared] instantiateEntity:@"House"];
    [[CTemplateManager shared] instantiateEntity:@"TileMapRenderer"];
    */
    
    //[[CTemplateManager shared] instantiateEntity:@"Character1"];
    //[[CTemplateManager shared] instantiateEntity:@"Camera"];
    [[CTemplateManager shared] instantiateEntity:@"Megamen"];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
}

@end

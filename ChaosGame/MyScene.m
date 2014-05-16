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

- (void)testMethod:(UITapGestureRecognizer * )recognizer
{
    CGPoint touchLocation = [recognizer locationInView:self.view];
    NSLog(@"Location x:%f y:%f", touchLocation.x, touchLocation.y);
}

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        // handling code
    }
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
    gameLayer       = [[GameLayer alloc] init];
    gameLayer.name  = @"gameLayer";
    cameraLayer     = [[CameraLayer alloc] init];
    cameraLayer.name = @"cameraLayer";
    
    // Add layers by considering the layer order
    [self addChild:gameLayer];
    [self addChild:cameraLayer];
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
    [[CTemplateManager shared] instantiateEntity:@"TileMapRenderer"];
    */
    
    [[CTemplateManager shared] instantiateEntity:@"Character1"];
    [[CTemplateManager shared] instantiateEntity:@"Character2"];
    [[CTemplateManager shared] instantiateEntity:@"Character3"];
    [[CTemplateManager shared] instantiateEntity:@"Camera"];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
}

@end

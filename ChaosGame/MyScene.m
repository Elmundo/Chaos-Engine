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
    self.backgroundColor = [SKColor redColor];
    
    //[self createTestEntitites];
    [self createBirdiotWithTemplate];
    //[self createBirdiotEntitites];
    //[self createSpawner];
}

- (void)createSpawner
{
    CEngineSystem *spawner = [[PipeSpawnerSystem alloc] init];
    [[CEngine shared] addSystem:spawner];
}

- (void)createBirdiotEntitites
{
    //[self createBackground];
    [self createBirdiot];
}

/* Create background entity */
- (void)createBackground
{
    CEntity *bgEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:0.0f and:98.0f];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"bg.png";
    rendererComponent.positionRef = positionComponent.position;
    //rendererComponent.textureSize = [[CSize alloc] initWithWidth:320 andHeight:441];
    
    CBackgroundComponent *bgComponent = [[CBackgroundComponent alloc] init];
    bgComponent.renderRef = rendererComponent.spriteNode;
    bgComponent.positionRef = positionComponent.position;
    bgComponent.sceneName = NSStringFromClass([self class]);
    
    [bgEntity addComponent:positionComponent];
    [bgEntity addComponent:rendererComponent];
    [bgEntity addComponent:bgComponent];
    
    [bgEntity initialize:@"bg"];

}

/* Create birdiod entity */
- (void)createBirdiot
{
    CEntity *birdEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:74.0f and:240.0f];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"bird.png";
    rendererComponent.atlasName = @"birdiot";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.anchorPoint = [[CPoint alloc] initWithCGPoint:self.anchorPoint];
    
    CAnimationComponent *animationComponent = [[CAnimationComponent alloc] init];
    animationComponent.rendererComponent = rendererComponent;
    
    CControllerComponent *birdController = [[CControllerComponent alloc] init];
    
    CBirdComponent *birdComponent = [[CBirdComponent alloc] init];
    birdComponent.positionRef = positionComponent;
    
    [birdEntity addComponent:positionComponent];
    [birdEntity addComponent:rendererComponent];
    [birdEntity addComponent:animationComponent];
    [birdEntity addComponent:birdController];
    [birdEntity addComponent:birdComponent];
    
    [birdEntity initialize:@"bird"];
}

- (void)createBirdiotWithTemplate
{
    // Load the level xml description file
    [[CTemplateManager shared] loadFile:@"birdiot_level.xml"];
    
    // Instantiate the entities which will be visible in game
    [[CTemplateManager shared] instantiateEntity:@"Birdiot"];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
}

@end

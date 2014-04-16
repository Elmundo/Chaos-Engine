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
    [self createLayers];
    self.backgroundColor = [SKColor redColor];
    
    //[self createTestEntitites];
<<<<<<< HEAD
    //[self AllEntities];
    [self createBirdiotEntitites];
    
    CEngineSystem *spawner = [[PipeSpawnerSystem alloc] initWithLayer:pipeLayer];
=======
    [self createBirdiotWithTemplate];
    //[self createBirdiotEntitites];
    //[self createSpawner];
}

- (void)createSpawner
{
    CEngineSystem *spawner = [[PipeSpawnerSystem alloc] init];
>>>>>>> 57541721ef0e77bbabb8d8dc6d9f13b4932439b7
    [[CEngine shared] addSystem:spawner];
}

- (void)createLayers
{
    birdLayer   = [[CLayer alloc] init];
    groundLayer = [[CLayer alloc] init];
    pipeLayer   = [[CLayer alloc] init];
    bgLayer     = [[CLayer alloc] init];
    
    [self addChild:bgLayer];
    [self addChild:pipeLayer];
    [self addChild:groundLayer];
    [self addChild:birdLayer];
}

/* My custom assets and physic test*/
- (void)AllEntities
{
    //[self createBoxPlayer];
    [self createBg];
    [self createTiles];
}

- (void)createBoxPlayer
{
    CEntity *player = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:74.0f and:240.0f];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.layer = birdLayer;
    rendererComponent.resourceName = @"player.png";
    rendererComponent.positionRef = positionComponent.position;
    
    CControllerComponent *controller = [[CControllerComponent alloc] init];
    
    [player addComponent:positionComponent];
    [player addComponent:rendererComponent];
    [player addComponent:controller];
    
    [player initialize:@"Player"];
}

- (void)createBg
{
    CEntity *bg = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:0.0f and:0.0f];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.layer = bgLayer;
    rendererComponent.resourceName = @"map.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.sceneName = NSStringFromClass([self class]);
    
    CBackgroundComponent *bgComponent = [[CBackgroundComponent alloc] init];
    bgComponent.layer = groundLayer;
    bgComponent.renderRef = rendererComponent.spriteNode;
    bgComponent.positionRef = positionComponent.position;
    
    [bg addComponent:positionComponent];
    [bg addComponent:rendererComponent];
    //[bg addComponent:bgComponent];
    [bg initialize:@"Map"];
}

- (void)createTiles
{
    for (int i=0; i < 15; ++i) {
        for (int j=0; j < 10; ++j) {
            
            CEntity *tile = [[CEntityFactory shared] createEntity];
            
            CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
            positionComponent.position = [[CPoint alloc] initWithX:(i*32) and:(j*32)];
            
            CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
            rendererComponent.layer = bgLayer;
            rendererComponent.resourceName = @"dirtj.jpg";
            rendererComponent.positionRef = positionComponent.position;
            rendererComponent.sceneName = NSStringFromClass([self class]);

            [tile addComponent:positionComponent];
            [tile addComponent:rendererComponent];
            
            NSString *str = [NSString stringWithFormat:@"tile %d", (i*10 + j)];
            [tile initialize:str];
        }
    }
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
    rendererComponent.layer = bgLayer;
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"bg.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.sceneName = NSStringFromClass([self class]);
    //rendererComponent.textureSize = [[CSize alloc] initWithWidth:320 andHeight:441];
    
    CBackgroundComponent *bgComponent = [[CBackgroundComponent alloc] init];
    bgComponent.layer = groundLayer;
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
    rendererComponent.layer = birdLayer;
    rendererComponent.resourceName = @"bird.png";
    rendererComponent.atlasName = @"birdiot";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.anchorPoint = [[CPoint alloc] initWithCGPoint:self.anchorPoint];
    
    CAnimationComponent *animationComponent = [[CAnimationComponent alloc] init];
    animationComponent.rendererComponent = rendererComponent;
    
    CControllerComponent *birdController = [[CControllerComponent alloc] init];
    
    CBirdComponent *birdComponent = [[CBirdComponent alloc] init];
    birdComponent.positionRef = positionComponent;
    
    CPhysicComponent *physicComponent = [[CPhysicComponent alloc] init];
    physicComponent.category  = birdCategory;
    physicComponent.collision = groundCategory | pipeCategory;
    physicComponent.contact   = groundCategory | pipeCategory;
    physicComponent.dynamic = YES;
    
    [birdEntity addComponent:positionComponent];
    [birdEntity addComponent:rendererComponent];
    [birdEntity addComponent:animationComponent];
    [birdEntity addComponent:birdController];
    [birdEntity addComponent:birdComponent];
    [birdEntity addComponent:physicComponent];
    
    [birdEntity initialize:@"bird"];
}

- (void)createBirdiotWithTemplate
{
    [[CTemplateManager shared] loadFile:@"birdiot_level.xml"];
    [[CTemplateManager shared] instantiateEntity:@"Birdiot"];
}

- (void)createTestEntitites
{
    /* TEST LEVEL IS LOADING : Implementing data-driven paradigm */
    [[CTemplateManager shared] loadFile:@"test_level.xml"];
    [[CTemplateManager shared] instantiateEntity:@"TestEntity"];
    
    /* ALL THESE DATA MUST BE DEFINED IN XML */
    /* Create the sekeleton entity and its all components*/
    /*
    CEntity *skeletonEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:CGRectGetMidX(self.frame) and:CGRectGetMidY(self.frame)];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"android.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.atlasName = @"android";
    
    CAnimationComponent *animationComponent = [[CAnimationComponent alloc] init];
    animationComponent.rendererComponent = rendererComponent;
    
    CControllerComponent *controllerComponent = [[CControllerComponent alloc] init];
    [skeletonEntity addComponent:positionComponent];
    [skeletonEntity addComponent:rendererComponent];
    [skeletonEntity addComponent:animationComponent];
    [skeletonEntity addComponent:controllerComponent];
    [skeletonEntity initialize:@"skeletion01"];
    */
    //[self performSelector:@selector(updateTest:) withObject:animationComponent afterDelay:3.0f];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
}

@end

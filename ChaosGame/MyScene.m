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
        [CLogger logWithTarget:self method:@"initWithSize:" message:@"My scene is init."];
        NSLog(@"ViewController size = Width:%f Height:%f", size.width, size.height);
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
    [self createBirdiotEntitites];
}

- (void)createBirdiotEntitites
{
    [self createBackground];
    [self createBirdiot];
    [self createPipe];
}

/* Create background entity */
- (void)createBackground
{
    CEntity *bgEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:0.0f and:0.0f];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"bg.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.textureSize = [[CSize alloc] initWithWidth:320 andHeight:382];
    
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
    positionComponent.position = [[CPoint alloc] initWithX:74.0f and:-240.0f];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"bird-1.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.textureSize = [[CSize alloc] initWithWidth:32 andHeight:22];
    rendererComponent.anchorPoint = [[CPoint alloc] initWithCGPoint:self.anchorPoint];
    
    CBirdComponent *birdComponent = [[CBirdComponent alloc] init];
    birdComponent.positionRef = positionComponent;
    
    [birdEntity addComponent:positionComponent];
    [birdEntity addComponent:rendererComponent];
    [birdEntity addComponent:birdComponent];
    
    [birdEntity initialize:@"bird"];
}

/* Create pipe entity */
- (void)createPipe
{
    CEntity *pipeEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:100.0f and:-100.0f];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"tube-inner.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.textureSize = [[CSize alloc] initWithWidth:83 andHeight:1];
    
    CPipeComponent *pipeComponent = [[CPipeComponent alloc] init];
    pipeComponent.sceneName = NSStringFromClass([self class]);
    
    [pipeEntity addComponent:positionComponent];
    [pipeEntity addComponent:rendererComponent];
    [pipeEntity addComponent:pipeComponent];
    
    [pipeEntity initialize:@"pipe"];
}

- (void)createTestEntitites
{
    /* TEST LEVEL IS LOADING : Implementing data-driven paradigm */
    [[CTemplateManager shared] loadFile:@"test_level.xml"];
    [[CTemplateManager shared] instantiateEntity:@"TestEntity"];
    
    /* ALL THESE DATA MUST BE DEFINED IN XML */
    /* Create the sekeleton entity and its all components*/
    
    CEntity *skeletonEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:CGRectGetMidX(self.frame) and:CGRectGetMidY(self.frame)];
    
    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"android.png";
    rendererComponent.positionRef = positionComponent.position;
    rendererComponent.atlasName = @"android";
    
    CAnimationComponent *animationComponent = [[CAnimationComponent alloc] init];
    animationComponent.renderRef = rendererComponent.spriteNode; //TODO: CSPriteNode' yaratıp içerisinde spriteNode'un referansı tutulmadığı sürece bu kod
    animationComponent.atlasRef = rendererComponent.atlas; // TODO: Sürekli nil atanıyor.
    
    CControllerComponent *controllerComponent = [[CControllerComponent alloc] init];
    [skeletonEntity addComponent:positionComponent];
    [skeletonEntity addComponent:rendererComponent];
    [skeletonEntity addComponent:animationComponent];
    [skeletonEntity addComponent:controllerComponent];
    [skeletonEntity initialize:@"skeletion01"];
    
    [self performSelector:@selector(updateTest:) withObject:animationComponent afterDelay:3.0f];
}

-(void)updateTest:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"DownMove"];
    
    [self performSelector:@selector(updateTest1:) withObject:animationComponent afterDelay:4.0f];
}

-(void)updateTest1:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"LeftMove"];
    
    [self performSelector:@selector(updateTest2:) withObject:animationComponent afterDelay:4.0f];
}

-(void)updateTest2:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"TopMove"];
    
    [self performSelector:@selector(updateTest3:) withObject:animationComponent afterDelay:4.0f];
}

-(void)updateTest3:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"RightMove"];
    
    [self performSelector:@selector(updateTest:) withObject:animationComponent afterDelay:4.0f];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
}

@end

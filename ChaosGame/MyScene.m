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
    }

    return self;
}

- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    
    CTemplateManager *templateManager = [[CTemplateManager alloc] init];
    
    /* ALL THESE DATA MUST BE DEFINED IN XML */
    /* Create the sekeleton entity and its all components*/
    /*
     [CTemplateManager shared] initLevel:@"Level1"];
     */
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

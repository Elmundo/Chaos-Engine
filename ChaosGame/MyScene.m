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
    
    /* ALL THESE DATA MUST BE DEFINED IN XML */
    /* Create the sekeleton entity and its all components*/
    CEntity *skeletonEntity = [[CEntityFactory shared] createEntity];
    
    CPositionComponent *positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:CGRectGetMidX(self.frame) and:CGRectGetMidY(self.frame)];

    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.scene = self;
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"character.png";
    rendererComponent.positionRef = positionComponent.position;
    
    NSDictionary *list = @{@"topstand": @1,
                           @"topmove": @8,
                           @"leftstand": @1,
                           @"leftmove": @8,
                           @"downstand": @1,
                           @"downmove": @8,
                           @"rightstand": @1,
                           @"rightmove": @8
                           };
    
    CAnimationComponent *animationComponent = [[CAnimationComponent alloc] init];
    animationComponent.atlasName = @"character";
    animationComponent.animationList = list;
    animationComponent.renderRef = rendererComponent;
    
    [skeletonEntity addComponent:positionComponent];
    [skeletonEntity addComponent:rendererComponent];
    [skeletonEntity addComponent:animationComponent];
    [skeletonEntity initialize:@"skeletion01"];
    
    [self performSelector:@selector(updateTest:) withObject:animationComponent afterDelay:1.0f];
}

-(void)updateTest:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"downmove"];
    
    //[self performSelector:@selector(updateTest1:) withObject:animationComponent afterDelay:4.0f];
}

-(void)updateTest1:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"leftmove"];
    
    [self performSelector:@selector(updateTest2:) withObject:animationComponent afterDelay:4.0f];
}

-(void)updateTest2:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"downmove"];
    
    [self performSelector:@selector(updateTest3:) withObject:animationComponent afterDelay:4.0f];
}

-(void)updateTest3:(id)object
{
    CAnimationComponent *animationComponent = object;
    [animationComponent playAnimationWithName:@"rightmove"];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

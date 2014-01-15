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
    
    CEntity *skeletonEntity = [[CEntityFactory shared] createEntity];
    
    positionComponent = [[CPositionComponent alloc] init];
    positionComponent.position = [[CPoint alloc] initWithX:CGRectGetMidX(self.frame) and:CGRectGetMidY(self.frame)];

    CRenderComponent *rendererComponent = [[CRenderComponent alloc] init];
    rendererComponent.scene = self;
    rendererComponent.sceneName = NSStringFromClass([self class]);
    rendererComponent.resourceName = @"sword.png";
    rendererComponent.positionRef = positionComponent.position;
    
    [skeletonEntity addComponent:positionComponent];
    [skeletonEntity addComponent:rendererComponent];
    [skeletonEntity initialize:@"skeletion01"];
    
    [self performSelector:@selector(updatePosition) withObject:nil afterDelay:5.0f];
    //positionComponent.position = CGPointMake(50, 50);
}

-(void)updatePosition
{
    [positionComponent setPoint:50 and:50];
    [CLogger logWithTarget:self method:@"updatePosition" message:@"Sword position is updated"];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

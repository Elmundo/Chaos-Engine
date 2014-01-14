//
//  CScene.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CScene.h"

@implementation CScene



-(id)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.contentCreated = NO;
        self.sceneName = NSStringFromClass([self class]);
    }
    
    return self;
}

/* Called before each frame is rendered */
-(void)update:(CFTimeInterval)currentTime
{
    
}

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

/* Override this method in subclass */
- (void)createSceneContents
{
    
}

@end

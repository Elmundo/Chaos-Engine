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

/* Called before each frame is rendered */
-(void)update:(CFTimeInterval)currentTime
{
    [self.delegate update:currentTime];
}

/* Called when user make some touch inputs */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate touchesMoved:touches withEvent:event];
}

@end

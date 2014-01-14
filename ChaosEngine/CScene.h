//
//  CScene.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CLogger.h"

@interface CScene : SKScene

@property (nonatomic, assign) BOOL contentCreated;
@property (nonatomic, strong) NSString *sceneName;

-(id)initWithSize:(CGSize)size;

/* Called before each frame is rendered */
-(void)update:(CFTimeInterval)currentTime;

/* Called whenever the scene is presented by a view, but in this case, the scene's contents should only be configured the first time the scene is presented. */
- (void)didMoveToView:(SKView *)view;

/* Override this method in subclass */
- (void)createSceneContents;

@end

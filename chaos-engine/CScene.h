//
//  CScene.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CPhysicSystem.h"

@protocol CSceneDelegate <NSObject>

- (void)update:(CFTimeInterval)currentTime;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@interface CScene : SKScene<UIGestureRecognizerDelegate>
{
    NSDictionary *_config;
}

@property (nonatomic, strong) id<CSceneDelegate> delegate; // CEngine object
@property (nonatomic, assign) BOOL contentCreated;
@property (nonatomic, strong) NSString *sceneName;
@property (nonatomic, strong) NSMutableArray *layers;


/* Experimental */
@property UITapGestureRecognizer *tapGesture;
@property UILongPressGestureRecognizer *longGesture;
@property UIPanGestureRecognizer *panGesture;
@property UISwipeGestureRecognizer *swipeGesture;
@property UIGestureRecognizer *recognizer;

-(id)initWithSize:(CGSize)size;

/* Called before each frame is rendered */
-(void)update:(CFTimeInterval)currentTime;

/* Called whenever the scene is presented by a view, but in this case, the scene's contents should only be configured the first time the scene is presented. */
- (void)didMoveToView:(SKView *)view;

/* Override this method in subclass */
- (void)createSceneContents;

@end

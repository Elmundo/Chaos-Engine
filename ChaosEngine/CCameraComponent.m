//
//  CCameraComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CCameraComponent.h"

@implementation CCameraComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    // Check this link
    //https://developer.apple.com/library/ios/documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/GestureRecognizer_basics/GestureRecognizer_basics.html#//apple_ref/doc/uid/TP40009541-CH2-SW2
    [super didAddedToEntity:owner];
    
    _sceneManager = [owner getProperty:_sceneManagerProperty];
    if([_sceneManager respondsToSelector:@selector(getLayerWithName:)])
    {
        _cameraLayer = [_sceneManager performSelector:@selector(getLayerWithName:) withObject:_layerName];
    }
    
    UIApplication<UIApplicationDelegate> *application = [UIApplication sharedApplication].delegate;
    UIWindow *window = application.window;
    
    /*Red sprite*/
    ASpriteNode *interfaceRed = [ASpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(240, 320)];
    interfaceRed.anchorPoint = CGPointMake(0, 0);
    interfaceRed.alpha = 0.5f;
    interfaceRed.position = CGPointMake(0, 0);
    interfaceRed.userInteractionEnabled = YES;
    
    /*Red sprite*/
    BSpriteNode *interfaceBlue = [BSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(140, 120)];
    interfaceBlue.anchorPoint = CGPointMake(0, 0);
    interfaceBlue.alpha = 0.5f;
    interfaceBlue.position = CGPointMake(40, 40);
    interfaceBlue.userInteractionEnabled = YES;
    
    [interfaceRed addChild:interfaceBlue];
    
    [_cameraLayer addChild:interfaceRed];
    
    //_gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesture_is_activited:)];
    
    //[window addGestureRecognizer:_gesture];
}

- (void)gesture_is_activited:(UIEvent*)sender
{
    clog(@"Camera gesture is touched.");
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
}

@end

//
//  CInputSystem.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"
@class CControllerComponent;


/*
    Listen to all touch events of the scene
 */
@interface CInputSystem : CEngineSystem

@property (nonatomic, strong) NSMutableArray *components;

+ (id)shared;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)addController:(CControllerComponent *)controller;
- (void)removeController:(CControllerComponent *)controller;

@end

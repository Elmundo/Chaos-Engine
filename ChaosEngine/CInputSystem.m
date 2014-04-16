//
//  CInputSystem.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CInputSystem.h"
#import "CEngine.h"
#import "CControllerComponent.h"

@implementation CInputSystem

+ (id)shared
{
    static CInputSystem *instance = nil;
    if (instance == nil) {
        instance = [[CInputSystem alloc] init];
        instance.systemType = kEngineSystemTypeInput;
    }
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _components = [NSMutableArray arrayWithCapacity:10];
    }
    
    return self;
}

- (void)update:(NSTimeInterval)dt
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    for (CControllerComponent *controller in _components) {
        [controller touchesBegan:touches withEvent:event];
    }
     */
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    for (CControllerComponent *controller in _components) {
        [controller touchesMoved:touches withEvent:event];
    }
     */
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    for (CControllerComponent *controller in _components) {
        [controller touchesEnded:touches withEvent:event];
    }
     */
}

- (void)addController:(CControllerComponent *)controller
{
    [_components addObject:controller];
}

- (void)removeController:(CControllerComponent *)controller
{
    [_components removeObject:controller];
}

@end

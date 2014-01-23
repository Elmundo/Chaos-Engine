//
//  CInputSystem.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CInputSystem.h"
#import "CEngine.h"

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

- (void)update:(NSTimeInterval)dt
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end

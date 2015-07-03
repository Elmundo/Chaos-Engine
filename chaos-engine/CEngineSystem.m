//
//  CEngineSystem.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"
#import "CEngine.h"

@implementation CEngineSystem

- (id)init
{
    self = [super init];
    if (self) {
        _systemType = kEngineSystemTypeUpdate;
    }
    
    return self;
}

- (void)update:(NSTimeInterval)dt
{
    // Some Stuff
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Some Stuff
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Some Stuff
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Some Stuff
}

- (void)didBeginContact:(SKPhysicsContact *)contact
{
    // Some Stuff
}

- (void)didEndContact:(SKPhysicsContact *)contact
{
    // Some Stuff
}

@end

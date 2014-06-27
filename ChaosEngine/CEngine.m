//
//  CEngine.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngine.h"

@implementation CEngine

+ (CEngine *)shared
{
    static CEngine *instance = nil;
    if (!instance) {
        instance = [CEngine new];
    }
    
    return instance;
}

+ (CEngine *)initChaosEngine
{
    return [CEngine shared];
}

- (id)init
{
    self = [super init];
    if (self) {
        _systems = [[NSMutableDictionary alloc] init];

        clog(@"Chaos game engine is initiated.");
        //For experimantal, update or timer, make your choice.
        //_timer = [NSTimer scheduledTimerWithTimeInterval:0.016f target:self selector:@selector(main_update:) userInfo:nil repeats:YES];
    }
    
    return self;
}

- (void)addSystem:(CEngineSystem *)system
{
    system.engine = self;
    //[_systems setObject:system forKey:NSStringFromClass([system class])];
    [_systems setObject:system forKey:system.name];
}

- (void)removeSystem:(CEngineSystem *)system
{
    system.engine = nil;
    //[_systems removeObjectForKey:NSStringFromClass([system class])];
    [_systems removeObjectForKey:system.name];
}

- (CEngineSystem *)getSystem:(NSString *)name
{
    // NOT IMPLEMENTED YET!
    return nil;
}

#pragma mark CSceneDelegate
- (void)update:(CFTimeInterval)currentTime
{
    _systemTime = currentTime;
    _elapsedTime = currentTime - _prevTime;
    _prevTime = currentTime;
    
    static bool firsTime = true;
    if (firsTime) {
        _elapsedTime = 0.16;
        firsTime = false;
    }
    
    for (NSString *key in _systems) {
        CEngineSystem *system =  [_systems objectForKey:key];
        if ([system respondsToSelector:@selector(update:)] && system.systemType == kEngineSystemTypeUpdate) {
            [system update:_elapsedTime];
        }
    }
}
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (NSString *key in _systems) {
        CEngineSystem *system =  [_systems objectForKey:key];
        if ([system respondsToSelector:@selector(touchesBegan:withEvent:)] && system.systemType == kEngineSystemTypeInput) {
            [system touchesBegan:touches withEvent:event];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (NSString *key in _systems) {
        CEngineSystem *system =  [_systems objectForKey:key];
        if ([system respondsToSelector:@selector(update:)] && system.systemType == kEngineSystemTypeInput) {
            [system touchesMoved:touches withEvent:event];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (NSString *key in _systems) {
        CEngineSystem *system =  [_systems objectForKey:key];
        if ([system respondsToSelector:@selector(update:)] && system.systemType == kEngineSystemTypeInput) {
            [system touchesEnded:touches withEvent:event];
        }
    }
}
*/
-(void)didBeginContact:(SKPhysicsContact *)contact
{
    for (NSString *key in _systems) {
        CEngineSystem *system =  [_systems objectForKey:key];
        if ([system respondsToSelector:@selector(update:)] && system.systemType == KEngineSystemTypePhysic) {
            [system didBeginContact:contact];
        }
    }
}

- (void)didEndContact:(SKPhysicsContact *)contact
{
    for (NSString *key in _systems) {
        CEngineSystem *system =  [_systems objectForKey:key];
        if ([system respondsToSelector:@selector(update:)] && system.systemType == KEngineSystemTypePhysic) {
            [system didEndContact:contact];
        }
    }
}

@end

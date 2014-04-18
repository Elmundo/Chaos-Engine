//
//  CPhysicSystem.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPhysicSystem.h"
#import "CEngine.h"
#import "CPhysicComponent.h"

@implementation CPhysicSystem

+ (id)shared
{
    static CPhysicSystem *instance = nil;
    if (instance == nil) {
        instance = [[CPhysicSystem alloc] init];
        instance.systemType = KEngineSystemTypePhysic;
        instance.name = @"PhysicSystem";
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

- (void)add:(CPhysicComponent *)collider
{
    [_components addObject:collider];
}

- (void)remove:(CPhysicComponent *)collider
{
    [_components removeObject:collider];
}

/* Physic Operations*/
-(void)didBeginContact:(SKPhysicsContact *)contact
{
    for (CPhysicComponent *comp in _components) {
        
        if (contact.bodyA == comp.physicBody || contact.bodyB == comp.physicBody) {
            [comp didBeginContact:contact];
            break;
        }
        
    }
}

- (void)didEndContact:(SKPhysicsContact *)contact
{
    for (CPhysicComponent *comp in _components) {
        
        if (contact.bodyA == comp.physicBody) {
            [comp didEndContact:contact];
            break;
        }
        
    }
}

@end

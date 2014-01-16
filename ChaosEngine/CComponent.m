//
//  CComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CEntity.h"

@implementation CComponent

- (id)init
{
    self = [super init];
    if (self) {
        self.componentName = NSStringFromClass([self class]);
    }
    
    return self;
}

/* Override this method in subclass */
- (void)didAddedToEntity:(CEntity *)owner
{
    [CLogger logWithTarget:self method:@"Component is created" message:self.componentName];
}

/* Override this method in subclass */
- (void)didRemovedFromEntity
{
    self.owner = nil;
    self.componentName = nil;
    [self.owner removeComponent:self];
}

- (CComponent *)getComponent:(NSString *)componentName
{
    return [self.owner getComponentWithName:componentName];
}

- (void)addEventListener:(SEL)action message:(NSString *)message
{
    [_owner.dispatcher addEventListener:self withAction:action withEvent:message];
}

- (void)removeEventListener:(SEL)action message:(NSString *)message
{
    [_owner.dispatcher removeEventListener:self withAction:action withEvent:message];
}

- (void)dispatchEventWithMessage:(NSString *)message
{
    [_owner.dispatcher dispatchEvent:message];
}

- (void)destroy
{
    [self didRemovedFromEntity];
}

@end

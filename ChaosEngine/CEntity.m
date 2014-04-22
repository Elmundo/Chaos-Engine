//
//  CEntity.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEntity.h"
#import "CComponent.h"
#import "CEntityFactory.h"

@implementation CEntity

- (id)init
{
    self = [super init];
    if (self) {
        self.componentDic = [[NSMutableDictionary alloc] initWithCapacity:3];
        self.componentList = [NSMutableArray arrayWithCapacity:10];
        self.dispatcher = [[CEventDispatcher alloc] init];
        self.factory = [CEntityFactory shared];
    }
    
    return self;
}

- (void)initialize:(NSString *)entityName
{
    self.name = entityName;
    clog(@"['%@'] entity is created.", self.name);
    
    // Whether we order the component in xml, when we use
    // dictionary it still init random component.
    /*
    for (NSString *componentName in self.componentDic) {
        
        CComponent *component = [self.componentDic objectForKey:componentName];
        BOOL result = [component respondsToSelector:@selector(didAddedToEntity:)];
        if (result) {
            [component didAddedToEntity:self];
        }
    }
    */
    
    // To make an order for components in xml, we should use array instead of dic
    for (CComponent *component in _componentList) {
        [component didAddedToEntity:self];
    }
}

- (void)addComponent:(CComponent *)component
{
    component.owner = self;
    [self.componentDic setObject:component forKey:component.componentName];
    [_componentList addObject:component];
}

- (void)removeComponent:(CComponent *)component
{
    [self.componentDic removeObjectForKey:component.componentName];
    [_componentList removeObject:component];
}

- (CComponent *)getComponentWithName:(NSString *)componentName
{
    CComponent *component = [self.componentDic objectForKey:componentName];
    if (component == nil) {
        cerror(@"[EntityName: %@] There is no such a component [%@]", self.name, componentName);
        @throw [NSException exceptionWithName:@"ComponentException" reason:@"Component could not be found!" userInfo:nil];
    }
    
    return component;
}

- (id)getProperty:(CSerializable *)serializable
{
    return [serializable getPropertyWithEntity:self];
}

- (void)update:(NSTimeInterval)dt
{
    //Call all component's update method
    for (NSString *key in _componentDic) {
        CComponent *component = [_componentDic objectForKey:key];
        if ([component respondsToSelector:@selector(update:)]) {
            [component update:dt];
        }
    }
}

- (void)removeFromEntityFactory
{
    [self.factory removeEntity:self];
}

- (void)destroy
{
    for (NSString *key in _componentDic) {
        CComponent *component = [_componentDic objectForKey:key];
        [component didRemovedFromEntity];
    }
    
    [self removeFromEntityFactory];
    [self.componentDic removeAllObjects];
    
    self.componentDic = nil;
    self.factory = nil;
    self.dispatcher = nil;
    self.name = nil;
    self.eid = -1;
}

@end

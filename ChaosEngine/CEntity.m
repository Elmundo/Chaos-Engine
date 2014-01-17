//
//  CEntity.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEntity.h"
#import "CComponent.h"

@implementation CEntity

static unsigned entity_id = 0;

- (id)init
{
    self = [super init];
    if (self) {
        entity_id++;
        //self.entityName = [NSMutableString stringWithString:@"UnnamedEntityWithID+"];
        //[self.entityName stringByAppendingFormat:@"%i", _entity_id];
        
        self.componentDic = [[NSMutableDictionary alloc] initWithCapacity:3];
        self.dispatcher = [[CEventDispatcher alloc] init];
    }
    
    return self;
}

- (void)initialize:(NSString *)entityName
{
    self.entityName = entityName;
    [CLogger logWithTarget:self method:@"Entity is created" message:self.entityName];
    for (NSString *componentName in self.componentDic) {
        
        CComponent *component = [self.componentDic objectForKey:componentName];
        BOOL result = [component respondsToSelector:@selector(didAddedToEntity:)];
        if (result) {
            [component didAddedToEntity:self];
        }
    }
}

- (void)addComponent:(CComponent *)component
{
    component.owner = self;
    [self.componentDic setObject:component forKey:component.componentName];
}

- (void)removeComponent:(CComponent *)component
{
    [self.componentDic removeObjectForKey:component.componentName];
}

- (CComponent *)getComponentWithName:(NSString *)componentName
{
    CComponent *component = [self.componentDic objectForKey:componentName];
    if (component == nil) {
        NSLog(@"[CEntity: EntityName: %@] Error= There is no such a component %@", self.entityName, componentName);
    }
    
    return component;
}

+ (unsigned)entityID
{
    return entity_id;
}

@end

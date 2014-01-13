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

static int _entity_id = -1;

- (id)init
{
    self = [super init];
    if (self) {
        _entity_id++;
        self.entityName = [NSMutableString stringWithString:@"UnnamedEntityWithID+"];
        [self.entityName stringByAppendingFormat:@"%i", _entity_id];
        
        self.componentDic = [[NSMutableDictionary alloc] initWithCapacity:3];
    }
    
    return self;
}

- (void)addComponent:(CComponent *)component
{
    component.owner = self;
    [self.componentDic setObject:component forKey:component.componentName];
}

- (void)removeComponent:(CComponent *)component
{
    component.owner = nil;
    [self.componentDic removeObjectForKey:component.componentName];
}

@end

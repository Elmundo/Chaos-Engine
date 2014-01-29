//
//  CEntityFactory.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEntityFactory.h"

@implementation CEntityFactory

+ (id)shared
{
    static CEntityFactory *instance = nil;
    if (instance == nil) {
        instance = [[CEntityFactory alloc] init];
    }
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.entities = [[NSMutableArray alloc] init];
        self.entityIdList = [[NSMutableArray alloc] init];

        _lowestUnassignedEid = 1;
    }
    
    return self;
}

- (CEntity *)createEntity
{
    CEntity *entity = [[CEntity alloc] init];
    entity.eid = [self generateNewEid];
    
    [self.entities addObject:entity];
    [self.entityIdList addObject:@(entity.eid)];
    
    return entity;
}

- (void)removeEntity:(CEntity *)entity
{
    [self.entities removeObject:entity];
    [self.entityIdList removeObject:@(entity.eid)];
}

- (uint32_t)generateNewEid
{
    if (_lowestUnassignedEid < UINT32_MAX) {
        return _lowestUnassignedEid++;
    }else{
        for (uint32_t i=1; i < UINT32_MAX; ++i) {
            if (![self.entityIdList containsObject:@(i)]) {
                return i;
            }
        }
    }
    
    return 0;
}

- (void)update:(NSTimeInterval)dt
{
    for (CEntity *entity in _entities) {
        if ([entity respondsToSelector:@selector(update:)]) {
            [entity update:dt];
        }
    }
}

@end

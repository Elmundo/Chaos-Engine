//
//  CEntityFactory.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEntityFactory.h"

@implementation CEntityFactory

- (id)init
{
    self = [super init];
    if (self) {
        self.entityDic = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    
    return self;
}

- (CEntity *)createEntity
{
    CEntity *entity = [[CEntity alloc] init];
    
    [self.entityDic setObject:entity forKey:entity.entityName];
    
    return entity;
}

@end

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
        self.entityDic = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (CEntity *)createEntity
{
    CEntity *entity = [[CEntity alloc] init];
    [self.entityDic setObject:entity forKey:[NSString stringWithFormat:@"%i", [CEntity entityID]]];
    
    return entity;
}

- (void)update:(NSTimeInterval)dt
{
    for (NSString *key in _entityDic) {
        CEntity *entity = [_entityDic objectForKey:key];
        if ([entity respondsToSelector:@selector(update:)]) {
            [entity update:dt];
        }
    }
}

@end

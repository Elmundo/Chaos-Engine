//
//  CEntityFactory.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEngineSystem.h"
#import "CEntity.h"

@interface CEntityFactory : CEngineSystem

@property (nonatomic, strong) NSMutableArray *entities;
@property (nonatomic, strong) NSMutableArray *entityIdList;
@property (nonatomic, assign) uint32_t lowestUnassignedEid;

- (CEntity *)createEntity;

+ (id)shared;

@end

//
//  CEntityFactory.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEntity.h"

@interface CEntityFactory : NSObject

@property (nonatomic, strong) NSMutableDictionary *entityDic;

- (CEntity *)createEntity;

+ (id)shared;

@end

//
//  CEntity.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEntityDispatcher.h"

@class CComponent;

@interface CEntity : NSObject

@property (nonatomic, strong) NSMutableDictionary *componentDic;
@property (nonatomic, strong) NSString *entityName;
@property (nonatomic, strong) CEntityDispatcher *dispatcher;

- (void)initialize:(NSString *)entityName;
- (void)addComponent:(CComponent *)component;
- (void)removeComponent:(CComponent *)component;
- (CComponent *)getComponentWithName:(NSString *)componentName;
+ (unsigned)entityID;

@end

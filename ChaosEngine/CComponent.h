//
//  CComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLogger.h"
#import "CEvent.h"

@class CEntity;

@interface CComponent : NSObject

@property (nonatomic, weak) CEntity *owner;
@property (nonatomic, strong) NSString *componentName;

- (void)didAddedToEntity:(CEntity *)owner;
- (void)didRemovedFromEntity;
- (CComponent *)getComponent:(NSString *)componentName;
- (void)addEventListener:(SEL)action message:(NSString *)message;
- (void)removeEventListener:(SEL)action message:(NSString *)message;

@end

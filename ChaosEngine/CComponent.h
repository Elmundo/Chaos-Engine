//
//  CComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CEntity;

@interface CComponent : NSObject

@property (nonatomic, weak) CEntity *owner;
@property (nonatomic, strong) NSString *componentName;

@end

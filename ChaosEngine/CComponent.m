//
//  CComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CEntity.h"

@implementation CComponent

- (id)init
{
    self = [super init];
    if (self) {
        self.componentName = NSStringFromClass([self class]);
    }
    
    return self;
}

@end

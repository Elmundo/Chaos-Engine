//
//  CPositionComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CPositionComponent.h"

@implementation CPositionComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    
}

- (void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

- (CGPoint)getPosition
{
    return self.position;
}

@end

//
//  CPositionComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"

@interface CPositionComponent : CComponent

@property (nonatomic, assign) CGPoint position;

- (CGPoint)getPosition;

@end

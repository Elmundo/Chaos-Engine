//
//  CBirdComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CPoint.h"
#import "CPositionComponent.h"
#import "CEngine.h"

@interface CBirdComponent : CComponent

@property (nonatomic, strong) id positionRef; // Outside

@property (nonatomic, strong) CPositionComponent *positionComp;
@property (nonatomic, assign) float fixedYPos;

@end

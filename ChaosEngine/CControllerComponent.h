//
//  CControllerComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"

@interface CControllerComponent : CComponent

@property (nonatomic, strong) id renderRef; // Outside
@property (nonatomic, strong) id positionRef; // Outside

@end

//
//  CTestComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/7/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CPoint.h"

@interface CTestComponent : CComponent

@property (nonatomic, strong) CPoint *position;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surename;

@end

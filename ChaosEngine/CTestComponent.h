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

// Object Type
@property (nonatomic, strong) CPoint *position;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surename;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSDictionary *dic;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDecimalNumber *decimalNumber;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) id object;

//Scalar and Structure Type
@property (nonatomic, assign) int x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) long l;
@property (nonatomic, assign) char c;

@end

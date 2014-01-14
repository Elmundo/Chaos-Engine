//
//  CLogger.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CLogger.h"

@implementation CLogger

+ (id)shared
{
    static CLogger *instance = nil;
    if (!instance) {
        instance = [[CLogger alloc] init];
    }
    
    return instance;
}

- (void)logWithTarget:(id)class method:(NSString *)name message:(NSString *)message
{
    NSLog(@"LOG: [Class %@] method: [%@] | message: [%@]", NSStringFromClass([class class]), name, message);
}

- (void)debugWithTarget:(id)class method:(NSString *)name message:(NSString *)message
{
    NSLog(@"DEBUG: [Class %@] method: [%@] | message: [%@]", NSStringFromClass([class class]), name, message);
}

- (void)warnWithTarget:(id)class method:(NSString *)name message:(NSString *)message
{
    NSLog(@"WARN: [Class %@] method: [%@] | message: [%@]", NSStringFromClass([class class]), name, message);
}

- (void)errorWithTarget:(id)class method:(NSString *)name message:(NSString *)message
{
    NSLog(@"ERROR: [Class %@] method: [%@] | message: [%@]", NSStringFromClass([class class]), name, message);
}

@end

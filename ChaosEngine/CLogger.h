//
//  CLogger.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define cStringWithValue(str, value) [str stringByAppendingString:value]  

@interface CLogger : NSObject

//+ (id)shared;

+ (void)logWithTarget:(id)class method:(NSString *)name message:(NSString *)message;

+ (void)debugWithTarget:(id)class method:(NSString *)name message:(NSString *)message;

+ (void)warnWithTarget:(id)class method:(NSString *)name message:(NSString *)message;

+ (void)errorWithTarget:(id)class method:(NSString *)name message:(NSString *)message;

@end

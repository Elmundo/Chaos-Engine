//
//  CUtil.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPI 3.14f

@interface CUtil : NSObject

+ (CGPoint)transformPoint:(CGPoint)position;
+ (CGRect)eulerToUnit:(CGRect)euler andResourceSize:(CGSize)sourceSize;
+ (CGFloat)radianToAngle:(CGFloat)value;
+ (CGFloat)angleToRadian:(CGFloat)value;

@end

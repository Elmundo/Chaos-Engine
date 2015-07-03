//
//  CSize.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/24/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//
@import CoreGraphics;
#import "CSize.h"

@implementation CSize

- (id)init
{
    self = [super init];
    if (self) {
        _width = 0;
        _height = 0;
    }
    
    return self;
}

- (id)initWithWidth:(int)width andHeight:(int)height
{
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
    }
    
    return  self;
}

- (id)initWithCGSize:(CGSize)size
{
    self = [super init];
    if (self) {
        _width  = size.width;
        _height = size.height;
    }
    
    return  self;
}

- (CGSize)CGSize;
{
    return CGSizeMake(_width, _height);
}

#pragma mark GETTER & SETTER
- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"width"])
    {
        _width = [value intValue];
    }else if ([key isEqualToString:@"height"])
    {
        _height = [value intValue];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end

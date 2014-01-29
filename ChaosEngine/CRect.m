//
//  CRect.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/29/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRect.h"

@implementation CRect

- (id)init
{
    self = [self initWithX:0 y:0 width:0 height:0];
    if (self) {
     
    }
    
    return self;
}

- (id)initWithX:(int)x y:(int)y width:(int)width height:(int)height
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _width = width;
        _height = height;
    }
    
    return self;
}

- (id)initWithRect:(CRect *)rect
{
    self = [self initWithX:rect.x y:rect.y width:rect.width height:rect.height];
    if (self) {
        
    }
    
    return self;
}

- (id)initWithCGRect:(CGRect)rect
{
    self = [self initWithX:rect.origin.x y:rect.origin.y width:rect.size.width height:rect.size.height];
    if (self) {
        
    }
    
    return self;
}

@end

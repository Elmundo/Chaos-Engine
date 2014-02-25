//
//  CSize.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/24/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSize : NSObject

@property (nonatomic, assign) int width;
@property (nonatomic, assign) int height;

- (id)initWithWidth:(int)width andHeight:(int)height;

- (id)initWithCGSize:(CGSize)size;

- (CGSize)CGSize;

@end

//
//  CameraLayer.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 5/16/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CameraLayer.h"

@implementation CameraLayer

- (id)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;

    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    clog(@"CameraLayer touch method is called.");
    
    [super touchesBegan:touches withEvent:event];
    
    
    UIResponder *nextResponder = [self nextResponder];
    [nextResponder touchesBegan:touches withEvent:event];
}

@end

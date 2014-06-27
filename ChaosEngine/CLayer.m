//
//  CLayer.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/16/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CLayer.h"

@implementation CLayer

- (id)init
{
    self = [super init];
    if (self) {
        
        _sceneManager = [CSceneManager shared];
        self.userInteractionEnabled = TRUE;
    }
    
    return self;
}

- (CLayer *)sublayer
{
    NSArray *layers = [_sceneManager activeScene].layers;
    int index = [layers indexOfObject:self];
    
    if (index == 0) {
        return nil;
    }
    
    CLayer *sublayer = [layers objectAtIndex:index - 1];
    return sublayer;
}

-(UIResponder *)nextResponder
{
    return  [self sublayer];
}

@end

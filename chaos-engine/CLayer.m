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
/*
    Importand:If you implement a custom view to handle remote control events, action messages, shake-motion events with UIKit, or editing-menu messages,
    don’t forward the event or message to nextResponder directly to send it up the responder chain. 
    Instead, invoke the superclass implementation of the current event handling method and let UIKit handle the traversal of the responder chain for you.
*/
-(UIResponder *)nextResponder
{
    return  [self sublayer];
}

@end

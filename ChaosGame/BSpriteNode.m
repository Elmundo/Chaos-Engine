//
//  BSpriteNode.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 5/16/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "BSpriteNode.h"

@implementation BSpriteNode

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    clog(@"CSprite node is touched.");
    
    for (UITouch *touch in touches) {
        
        CGPoint pos = [touch locationInView:touch.view.superview];
        
    }
    
    
    UIResponder *nextResponder = self.nextResponder;
    [nextResponder touchesBegan:touches withEvent:theEvent];
}

- (UIResponder *)nextResponder
{
    return self.parent;
}

@end

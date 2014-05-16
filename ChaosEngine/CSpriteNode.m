//
//  CSpriteNode.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/6/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CSpriteNode.h"
#import "CEntity.h"
#import "CTouchEvent.h"

@implementation CSpriteNode

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    [super touchesBegan:touches withEvent:theEvent];
    clog(@"CSprite node is touched.");
    
    for (UITouch *touch in touches) {
        
        //clog(@"Touched view is %@", NSStringFromClass([touch.view class]));
        
    }
    
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchBegan] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    [super touchesMoved:touches withEvent:theEvent];
    
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchMoved] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    [super touchesEnded:touches withEvent:theEvent];
    
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchEnded] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    [super touchesCancelled:touches withEvent:theEvent];
    
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchCancelled] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];
}

@end

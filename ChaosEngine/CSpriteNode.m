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
    clog(@"CSpriteNode: touchesBegan");
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchBegan] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];
    
    // Here must be a flag which represent that event propagation will be implemented or not
    //[super touchesBegan:touches withEvent:theEvent];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchMoved] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];

    // Here must be a flag which represent that event propagation will be implemented or not
    //[super touchesMoved:touches withEvent:theEvent];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchEnded] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];
    
    // Here must be a flag which represent that event propagation will be implemented or not
    //[super touchesEnded:touches withEvent:theEvent];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    CTouchEvent *event = [CTouchEvent eventWithType:[CTouchEvent ETouchCancelled] withObject:touches withEvent:theEvent withBubbles:NO];
    [_owner.dispatcher dispatchEvent:event];
    
    // Here must be a flag which represent that event propagation will be implemented or not
    //[super touchesCancelled:touches withEvent:theEvent];
}

-(UIResponder *)nextResponder
{
    return self.parent;
}

@end

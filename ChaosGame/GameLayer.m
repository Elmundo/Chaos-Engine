//
//  GameLayer.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 5/16/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "GameLayer.h"

@implementation GameLayer

- (id)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        
        /*Red sprite*/
        /*
        CSpriteNode *interface = [CSpriteNode spriteNodeWithColor:[UIColor yellowColor] size:CGSizeMake(480, 320)];
        interface.anchorPoint = CGPointMake(0, 0);
        interface.alpha = 0.0f;
        interface.position = CGPointMake(0, 0);
        interface.userInteractionEnabled = YES;
        
        [self addChild:interface];
         */
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    clog(@"GameLayer touch method is called.");
    
    [self nextResponder];
    
    [super touchesBegan:touches withEvent:event];

}

- (UIResponder *)nextResponder
{
    return self.parent;
}

@end

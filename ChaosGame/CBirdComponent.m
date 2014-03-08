//
//  CBirdComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 2/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CBirdComponent.h"

@implementation CBirdComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _positionComp = _positionRef;
    _fixedYPos = _positionComp.position.y;
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

-(void)update:(NSTimeInterval)dt
{
    /*
    float sinValueBasenOnTimeValue = cosf([CEngine shared].systemTime * 8.5f);
    float newYPos = _fixedYPos + (sinValueBasenOnTimeValue * 4);
    
    [_positionComp setPoint:_positionComp.position.x and:newYPos];
     */
}

@end

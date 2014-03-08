//
//  CControllerComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/23/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CPoint.h"
#import "CPositionComponent.h"
#import "CAnimationComponent.h"

@class CInputSystem;

@interface CControllerComponent : CComponent
{
    float _vertSpeed;
    float _jumpSpeed;
    float _fallingConstant;
    float _tappedScreen;
}
@property (nonatomic, strong) id inputManager;

@property (nonatomic, strong) id renderRef; // Outside
@property (nonatomic, strong) id positionRef; // Outside

/*Custom code - delete later*/
@property (nonatomic, strong) CPositionComponent *pos;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end

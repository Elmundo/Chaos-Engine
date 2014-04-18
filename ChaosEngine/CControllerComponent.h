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
#import "CInputSystem.h"

@interface CControllerComponent : CComponent
{
    float _vertSpeed;
    float _jumpSpeed;
    float _fallingConstant;
    float _tappedScreen;
}
@property (nonatomic, weak) id inputManager;

@property (nonatomic, weak) id renderRef; // Outside
@property (nonatomic, weak) id positionRef; // Outside

/*Custom code - delete later*/
@property (nonatomic, weak) CPositionComponent *pos;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end

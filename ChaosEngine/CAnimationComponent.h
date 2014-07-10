//
//  CAnimationComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CScene.h"
#import "CRenderEvent.h"
#import <SpriteKit/SpriteKit.h>
#import "CPropertyReference.h"
#import "CSpriteNode.h"

//TODO: Baris - Move these macro defines to common Utils class
#define kAppendStr(str1, str2)  [str1 stringByAppendingString:str2]
#define kFormat @".png"
#define kDefaultTimePerFrame 0.125f

@interface CAnimationComponent : CComponent

/* OUTSIDE PROPERTIES */
@property (nonatomic, strong) CPropertyReference *spriteProperty; //Required
@property (nonatomic, strong) CPropertyReference *animationProperty; //Required
@property (nonatomic, assign) CGFloat intervalPerFrame; //Required
@property (nonatomic, assign) BOOL isResizable; //Required

/* INNER PROPERTIES */
@property (nonatomic, strong) CSpriteNode *spriteNode;
@property (nonatomic, strong) NSDictionary *animationDic;
@property (nonatomic, strong) SKAction *animationAction;

- (void)playAnimationWithName:(NSString *)animationName;

@end

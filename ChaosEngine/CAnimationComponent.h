//
//  CAnimationComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CScene.h"
#import "CTextureAtlas.h"
#import <SpriteKit/SpriteKit.h>

#define kAppendStr(str1, str2)  [str1 stringByAppendingString:str2]

#define kFormat @".png"
@interface CAnimationComponent : CComponent

@property (nonatomic, strong) id renderRef;

@property (nonatomic, strong) NSMutableDictionary *animationDic;

@property (nonatomic, strong) NSString *atlasName; //Filled from outside.
@property (nonatomic, strong) NSDictionary *animationList; //Filled from outside.

@property (nonatomic, strong) CTextureAtlas *textureAtlas;
@property (nonatomic, strong) SKAction *animationAction;

- (void)playAnimationWithName:(NSString *)animationName;

@end

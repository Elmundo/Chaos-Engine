//
//  CAnimationComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CScene.h"

#import <SpriteKit/SpriteKit.h>

#define kAppendStr(str1, str2)  [str1 stringByAppendingString:str2]

#define kFormat @".png"
@interface CAnimationComponent : CComponent

@property (nonatomic, strong) CScene *scene;
@property (nonatomic, strong) id renderRef;

@property (nonatomic, strong) SKTextureAtlas *textureAtlas;
@property (nonatomic, strong) NSMutableDictionary *animationDic;

@property (nonatomic, strong) NSString *atlasName;
@property (nonatomic, strong) NSDictionary *animationList;

@property (nonatomic, strong) SKAction *animationAction;

- (void)playAnimationWithName:(NSString *)animationName;

@end

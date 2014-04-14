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
#import "CRenderEvent.h"
#import <SpriteKit/SpriteKit.h>
#import "CPropertyReference.h"

#define kAppendStr(str1, str2)  [str1 stringByAppendingString:str2]
#define kFormat @".png"
#define kDefaultTimePerFrame 0.125f

@interface CAnimationComponent : CComponent

@property (nonatomic, strong) id rendererComponent;

@property (nonatomic, strong) SKSpriteNode *spriteNode;
@property (nonatomic, strong) CTextureAtlas *textureAtlas;
@property (nonatomic, strong) SKAction *animationAction;
@property (nonatomic, strong) CPropertyReference *renderProperty;
@property (nonatomic, strong) CComponent *renderComponent;
- (void)playAnimationWithName:(NSString *)animationName;

@end

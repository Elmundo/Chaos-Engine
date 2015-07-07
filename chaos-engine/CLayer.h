//
//  CLayer.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 3/16/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CSpriteNode.h"
#import "CSceneManager.h"
#import "CUtil.h"

@interface CLayer : SKNode
{
    CSceneManager *_sceneManager;
}

@property (nonatomic, assign) CGFloat speed;

- (CLayer *)sublayer;

@end

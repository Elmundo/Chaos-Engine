//
//  CTilemapRendererComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 01/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRendererComponent.h"
#import "TBXML.h"
#import "CSceneManager.h"
#import <SpriteKit/SpriteKit.h>

@interface CTilemapRendererComponent : CComponent
{
    TBXML *_tbxml;
    TBXMLElement *_rootElement;
    NSMutableArray *_collisionMatrix;
}

/* OUTSIDE PROPERTIES */
@property (nonatomic, strong) NSString *tilemapDataName;
@property (nonatomic, strong) CPoint *anchorPoint;

/* INNDER PROPERTIES */
@property (nonatomic, strong) CSceneManager *sceneManager;

@property (nonatomic, strong) NSMutableDictionary *tilesetDic;
@property (nonatomic, strong) NSMutableArray *tiles;
@property (nonatomic, strong) NSArray *layers;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat tileWidth;
@property (nonatomic, assign) CGFloat tileHeight;

@end

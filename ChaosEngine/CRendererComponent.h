//
//  CRenderComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/13/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CScene.h"
#import "CSceneManager.h"
#import "CPoint.h"
#import "CPositionEvent.h" 
#import "CRenderEvent.h"
#import "CSize.h"
#import "CLayer.h"
#import "CSpriteNode.h"
#import "CPropertyReference.h"
#import <SpriteKit/SpriteKit.h>

@interface CRendererComponent : CComponent

/* OUTSIDE PROPERTIES*/
@property (nonatomic, strong) CPropertyReference *positionProperty; //Required;
@property (nonatomic, strong) NSString *layerName; //Required
@property (nonatomic, strong) NSString *resourceName; // Required

@property (nonatomic, assign) CGFloat zPosition; //Optional
@property (nonatomic, strong) CSize *textureSize; // Optional
@property (nonatomic, strong) CPoint *anchorPoint; // Optional
@property (nonatomic, assign) CGFloat rotateValue; // Optional
@property (nonatomic, assign) CGFloat scaleFactor; // Optional
@property (nonatomic, assign) BOOL userInteractionEnabled; // Optional

/* INNER PROPERTIES */
@property (nonatomic, weak) CSceneManager *manager;
@property (nonatomic, strong) CLayer *layer;
@property (nonatomic, strong) CSpriteNode *spriteNode;
@property (nonatomic, strong) SKTexture *sourceTexture;
@property (nonatomic, weak) CPoint *position;


/* METHODS */
- (void)render;

@end

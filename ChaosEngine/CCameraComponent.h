//
//  CCameraComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CPropertyReference.h"
#import "CEngineSystem.h"
#import "CLayer.h"
#import "CSpriteNode.h"
#import "CSceneManager.h"

@interface CCameraComponent : CComponent

/* OUTSIDE PROPERTIES */
@property (nonatomic, strong) NSMutableArray *layerNameList; //Required
@property (nonatomic, strong) CPropertyReference *sceneManagerProperty;

/* INNER PROPERTIES */
@property (nonatomic, weak) CSceneManager *sceneManager;
@property (nonatomic, strong) NSMutableArray *layers;
@property (nonatomic, strong) NSString *layerName;
@property (nonatomic, strong) CLayer *cameraLayer;

/* METHODS */
- (void)moveCameraWithX:(int)x andY:(int)y;
- (void)setCameraPositionWithX:(int)x andY:(int)y;

@end

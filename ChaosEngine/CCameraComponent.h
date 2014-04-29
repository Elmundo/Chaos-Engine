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

@interface CCameraComponent : CComponent

@property (nonatomic, strong) CPropertyReference *sceneManagerProperty;

@property (nonatomic, weak) CEngineSystem *sceneManager;
@property (nonatomic, strong) NSString *layerName;
@property (nonatomic, strong) CLayer *cameraLayer;

@end

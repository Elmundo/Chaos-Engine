//
//  MyScene.h
//  ChaosDemo
//
//  Created by Baris Yilmaz on 3.07.2015.
//  Copyright (c) 2015 chaos. All rights reserved.
//
#import <CScene.h>

/*in Game Part*/
@class CLayer;

@interface MyScene : CScene
{
    CLayer *gameLayer;
    CLayer *uiLayer;
}

@end


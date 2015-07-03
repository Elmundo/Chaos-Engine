//
//  ViewController.m
//  ChaosDemo
//
//  Created by Baris Yilmaz on 3.07.2015.
//  Copyright (c) 2015 chaos. All rights reserved.
//

#import "MyScene.h"
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Create firt scene
    MyScene * scene =  [[MyScene alloc] initWithSize:self.rootView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    // Add scene to manager and activate it.
    [CSceneManager shared].rootView = self.rootView;
    [[CSceneManager shared] addScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end


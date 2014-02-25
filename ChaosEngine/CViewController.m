//
//  CViewController.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    /* If Nib file will not be used, this code blog shall be uncommented */
    /*
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.view = [[SKView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y,
                                                         bounds.size.width, bounds.size.height)];
    */
    [super viewDidLoad];
    
    // Configure the view.
    self.rootView = (SKView *)self.view;
    self.rootView.showsFPS = YES;
    self.rootView.showsNodeCount = YES;
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

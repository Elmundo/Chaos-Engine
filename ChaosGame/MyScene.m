//
//  MyScene.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/10/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */

    }
    
    //Create Entity Factory
    CEntityFactory *factory = [[CEntityFactory alloc] init];
    
    CEntity *e1 = [factory createEntity];
    
    CPositionComponent *posComponent = [[CPositionComponent alloc] init];
    CRenderComponent *renderComponent = [[CRenderComponent alloc] init];
    CPhysicComponent *physicComponent = [[CPhysicComponent alloc] init];
    
    [e1 addComponent:posComponent];
    [e1 addComponent:renderComponent];
    [e1 addComponent:physicComponent];
    
    return self;
}

-(void)testChaosEngine
{
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

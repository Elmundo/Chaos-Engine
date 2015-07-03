//
//  CContactEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/6/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEvent.h"
#import <SpriteKit/SpriteKit.h>

@interface CContactEvent : CEvent

@property (nonatomic, strong) SKPhysicsContact *physicContact;

/* Event Static Messages */
+ (NSString *)CE_Contact;

@end

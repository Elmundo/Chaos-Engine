//
//  CRenderEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEvent.h"
#import "CSpriteNode.h"

@interface CRenderEvent : CEvent

@property (nonatomic, strong) CSpriteNode *spriteNode;

+ (id)eventWithType:(NSString *)type;
- (id)initWithType:(NSString *)type;

/* Event Static Messages */
+ (NSString *)CE_SpriteReady;

@end

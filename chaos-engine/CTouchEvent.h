//
//  CTouchEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/21/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEvent.h"
#import "CSpriteNode.h"

@interface CTouchEvent : CEvent

@property (nonatomic, strong) UIEvent *event;
@property (nonatomic, strong) NSArray *touches;
@property (nonatomic, strong) CSpriteNode *spriteNode;

+ (id)eventWithType:(NSString *)type;
- (id)initWithType:(NSString *)type;

/* Event Static Messages */
+ (NSString*)ETouchBegan;
+ (NSString*)ETouchMoved;
+ (NSString*)ETouchEnded;
+ (NSString*)ETouchCancelled;

@end

//
//  CEntityListener.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/16/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CEventListener : NSObject

@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL action;

+ (CEventListener *)eventListenerWithTarget:(id)target andAction:(SEL)action;
- (id)initWithTarget:(id)target andAction:(SEL)action;

@end

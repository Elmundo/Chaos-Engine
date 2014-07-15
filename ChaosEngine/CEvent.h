//
//  CEvent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/15/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CEvent : NSObject

@property (nonatomic, strong) NSString *type;

+ (id)eventWithType:(NSString *)type;
- (id)initWithType:(NSString *)type;

/* Event Static Messages */
/* There is no static message for basic CEvent class */
@end

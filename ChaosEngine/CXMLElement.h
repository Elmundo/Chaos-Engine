//
//  CXMLElement.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface CXMLElement : NSObject

@property (nonatomic, assign) TBXMLElement *element;

- (id)initWithXml:(TBXMLElement *)element;

@end

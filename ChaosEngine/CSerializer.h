//
//  CSerializer.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import <objc/objc-runtime.h>
NS_ENUM(int, PropertyType)
{
    PropertyTypeClass = 0,
    PropertyTypeObject = 1,
    PropertyTypeScalar = 2
};

@interface CSerializer : NSObject

+ (CSerializer *)shared;
- (TBXMLElement *)serialize:(id)object;
- (id)deserialize:(TBXMLElement *)xml;

@end

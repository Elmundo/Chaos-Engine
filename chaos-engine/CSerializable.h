//
//  CSerializable.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TBXML.h>

@class CEntity;

@interface CSerializable : NSObject

- (void)deserialize:(TBXMLElement *)element;
- (id)getPropertyWithEntity:(CEntity *)owner;

@end

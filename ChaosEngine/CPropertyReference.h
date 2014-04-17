//
//  CPropertyReference.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEntity.h"
#import "CSerializable.h"
#import "CEngine.h"

@interface CPropertyReference : CSerializable

@property (nonatomic, strong) NSString *word;
@property (nonatomic, strong) NSArray *propertyList;
@property (nonatomic, strong) NSString *format;

- (id)initWithExpression:(NSString *)expression;
- (void)deserialize:(TBXMLElement *)element;
- (id)getPropertyWithEntity:(CEntity *)owner;

@end

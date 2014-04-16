//
//  CSerializable.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/14/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CSerializable.h"

@implementation CSerializable

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}


- (void)deserialize:(TBXMLElement *)element
{
    // Override this method in subclass
    @throw [NSException exceptionWithName:@"CSerializableAbstractClassException" reason:@"deserialize method must be overrided!" userInfo:nil];
}

- (id)getPropertyWithEntity:(CEntity *)owner
{
    // Override this method in subclass
    @throw [NSException exceptionWithName:@"CSerializableAbstractClassException" reason:@"getPropertyWithEntity method must be overrided!" userInfo:nil];
    return nil;
}

@end

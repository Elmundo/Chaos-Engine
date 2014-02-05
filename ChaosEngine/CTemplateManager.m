//
//  CTemplateManager.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CTemplateManager.h"

@implementation CTemplateManager

- (id)init
{
    self = [super init];
    if (self) {
        _templateDic = [NSMutableDictionary dictionaryWithCapacity:10];
        _entityDic   = [NSMutableDictionary dictionaryWithCapacity:10];
        _groupDic    = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    
    [self testTBXML];
    
    return self;
}

/* Test Method */
- (void)testTBXML
{
    NSError *error;
    TBXML *tbxml = [TBXML newTBXMLWithXMLFile:@"test_level.xml" error:&error];
    TBXMLElement *rootElement = tbxml.rootXMLElement;
    
    [self traverseElement:rootElement];
    [self textCreateEntity:@"SkeletonEntity1"];
}

/* Load a level file and adds its contents to the template manager. */

- (void)loadFile:(NSString *)fileName
{
    
}

- (void)traverseElement:(TBXMLElement *)element
{
    TBXMLElement *currentElemenet = element;
    while (currentElemenet) {
        
        TBXMLAttribute *currentAttribute = element->firstAttribute;
        
        while (currentAttribute) {
            currentAttribute = currentAttribute->next;
        }
        
        if (strcmp(currentElemenet->name, "Template") == 0){
            NSLog(@"Template");
        }
        
        if (strcmp(currentElemenet->name, "Entity") == 0){
            NSLog(@"Entity: %s", currentElemenet->firstAttribute->name);
            NSValue *entity = [NSValue valueWithPointer:currentElemenet];
            NSString *entityName = [NSString stringWithUTF8String:currentElemenet->firstAttribute->next->value];
            [_entityDic setValue:entity forKey:entityName];
        }
        
        if (strcmp(currentElemenet->name, "Group") == 0){
            NSLog(@"Group");
        }
        
        if (currentElemenet->currentChild) {
            [self traverseElement:currentElemenet->firstChild];
        }
        
        currentElemenet = currentElemenet->nextSibling;
    }
}

- (void)textCreateEntity:(NSString *)name
{
    NSValue *value = [_entityDic objectForKey:name];
    TBXMLElement *element = (TBXMLElement *)[value pointerValue];
    
    Class _C = NSClassFromString([NSString stringWithUTF8String:element->firstAttribute->value]);
    id entity= [_C new];
    
    TBXMLElement *component = element->firstChild;
    
}

- (void)update:(NSTimeInterval)dt
{
    // Some Stuff
}

@end

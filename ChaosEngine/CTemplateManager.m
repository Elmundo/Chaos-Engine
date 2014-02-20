//
//  CTemplateManager.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CTemplateManager.h"

@implementation CTemplateManager

+ (CTemplateManager *)shared
{
    static CTemplateManager * instance = nil;
    if (!instance) {
        instance = [[CTemplateManager alloc] init];
    }
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _templateDic = [NSMutableDictionary dictionaryWithCapacity:10];
        _entityDic   = [NSMutableDictionary dictionaryWithCapacity:10];
        _groupDic    = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    
    return self;
}

/* Load a level file and adds its contents to the template manager. 
   Root tag is data. As data tag's child there are only three available tags: Entity, Template, Group
   CTemplateManager only store the XML description of this structures as type of TBXElement.
   Not instantiating objects from these descriptions. To create objects from this information
   - it means to deserialize TBXElement to Objective-C objects - CSerializer singleton class must be used.
 */
- (void)loadFile:(NSString *)fileName
{
    NSError *error;
    TBXML *tbxml = [TBXML newTBXMLWithXMLFile:fileName error:&error];
    TBXMLElement *rootElement = [tbxml rootXMLElement];
    
    if (error) {
        NSLog(@"There is no such a file: %@", fileName);
        return;
    }
    
    //NO sibling for rootElement so send firstChild argument instead of root element.
    NSLog(@"Loading started for file: %@", fileName);
    [self traverseElement:rootElement->firstChild];
}

- (void)traverseElement:(TBXMLElement *)element
{
    /* Just traverse data tag's children, NOT their childs or attributes*/
    TBXMLElement *currentElemenet = element;
    while (currentElemenet) {
        
        if (strcmp(currentElemenet->name, "Template") == 0){
            NSLog(@"Loading Template: %@", [TBXML valueOfAttributeNamed:@"name" forElement:currentElemenet]);
            NSValue *template      = [NSValue valueWithPointer:currentElemenet];
            NSString *templateName = [TBXML valueOfAttributeNamed:@"name" forElement:currentElemenet];
            
            TBXMLElement *element = (TBXMLElement *)[template pointerValue];
            
            [_templateDic setValue:template forKey:templateName];
        }
        
        else if (strcmp(currentElemenet->name, "Entity") == 0){
            NSLog(@"Loading Entity: %@", [TBXML valueOfAttributeNamed:@"name" forElement:currentElemenet]);
            NSValue *entity      = [NSValue valueWithPointer:currentElemenet];
            NSString *entityName = [TBXML valueOfAttributeNamed:@"name" forElement:currentElemenet];
            
            [_entityDic setValue:entity forKey:entityName];
        }
        
        else if (strcmp(currentElemenet->name, "Group") == 0){
            NSLog(@"Loading Group: %@", [TBXML valueOfAttributeNamed:@"name" forElement:currentElemenet]);
            NSValue *group      = [NSValue valueWithPointer:currentElemenet];
            NSString *groupName = [TBXML valueOfAttributeNamed:@"name" forElement:currentElemenet];
            
            [_groupDic setValue:group forKey:groupName];
        }
        else {
            NSLog(@"Error! Invalid tag to read: %s", currentElemenet->name);
            NSLog(@"This tag will be ignored by TempalteManager and will not be cached.");
        }
        
        currentElemenet = currentElemenet->nextSibling;
    }
    
    NSLog(@"All XML descriptors are cached.");
}

- (id)instantiateEntity:(NSString *)entityName
{
    NSValue *entityXMLWrapper = [_entityDic objectForKey:entityName];
    TBXMLElement *elementXML = [entityXMLWrapper pointerValue];
    NSString *entityXMLName = [TBXML valueOfAttributeNamed:@"name" forElement:elementXML];
    
    // Initiate shell entity
    CEntity *newEntity = [[CEntityFactory shared] createEntity];
    newEntity.name = entityXMLName;
    
    [[CSerializer shared] deserialize:elementXML->firstChild];
    
    return newEntity;
}

@end

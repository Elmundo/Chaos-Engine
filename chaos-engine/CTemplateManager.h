//
//  CTemplateManager.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"
#import <TBXML.h>
#import "CSerializer.h"
#import "CEntityFactory.h"
#import "CSerializable.h"

@interface CTemplateManager : CEngineSystem
{
    TBXML *_sourceXML;
    NSMutableDictionary *_templateDic; // Template in TBXML format.
    NSMutableDictionary *_entityDic;   // Entity in TBXML format.
    NSMutableDictionary *_groupDic;    // Group in TBXML format.
    
    int _depthLevel;
}

+ (CTemplateManager *)shared;
- (void)loadFile:(NSString *)fileName;
- (id)instantiateEntity:(NSString *)entityName;

@end

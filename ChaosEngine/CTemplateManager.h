//
//  CTemplateManager.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"
#import "TBXML.h"

#import "CEntity.h"
#import "CComponent.h"

@interface CTemplateManager : CEngineSystem<NSXMLParserDelegate>
{
    NSMutableDictionary *_templateDic;
    NSMutableDictionary *_entityDic; // Entity in TBXML format.
    NSMutableDictionary *_groupDic;
    
    int _depthLevel;
}

@end

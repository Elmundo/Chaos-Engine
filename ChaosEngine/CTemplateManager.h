//
//  CTemplateManager.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/31/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CEngineSystem.h"
#import "TBXML.h"

@interface CTemplateManager : CEngineSystem<NSXMLParserDelegate>
{
    NSURL *_xmlURL;
    NSXMLParser *_parser;
    NSMutableDictionary *_xmlList;
    
    int _depthLevel;
}

@end

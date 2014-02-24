//
//  CTextureAtlas.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/21/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "CSerializable.h"
#import "CUtil.h"

@interface CTextureAtlas : NSObject<NSXMLParserDelegate>
{
    NSURL *_xmlURL;
    NSXMLParser *_parser;
    SKTexture *_atlas;
}

@property (nonatomic, strong) NSMutableDictionary *textureAtlas;

@property (nonatomic, strong) NSMutableArray *animationList;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, assign) unsigned width;
@property (nonatomic, assign) unsigned height;

+ (CTextureAtlas *)atlasWithXmlName:(NSString *)xmlName andWithResource:(SKTexture *)resource;
- (id)initWithXmlName:(NSString *)xmlName andWithResource:(SKTexture *)resource;
- (NSArray *)animationWithName:(NSString *)animationName;
- (SKTexture *)getFirstTexture;
@end

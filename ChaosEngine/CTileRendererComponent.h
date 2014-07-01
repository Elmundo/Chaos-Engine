//
//  CTileRendererComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/22/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CComponent.h"
#import "CTextureAtlas.h"
#import "CSceneManager.h"
#import "CLayer.h"
#import "CSpriteNode.h"
#import "CPoint.h"

@class CPropertyReference;

#define kDefaultTileWidth 32.0f
#define kDefaultTileHeight 32.0f

@interface CTileRendererComponent : CComponent<NSXMLParserDelegate>
{
    NSURL *_xmlURL;
    NSXMLParser *_parser;
}

/* OUTSIDE PROPERTIES */
@property (nonatomic, strong) CPropertyReference *spriteProperty; //Required
@property (nonatomic, strong) CPropertyReference *atlasProperty; //Required
@property (nonatomic, strong) CPropertyReference *layerProperty; //Required
@property (nonatomic, strong) NSString *tileMapData; //Required
@property (nonatomic, assign) NSInteger tileWidth; //Optional;
@property (nonatomic, assign) NSInteger tileHeight; //Optional;

/* INNER PROPERTIES */
@property (nonatomic, strong) NSMutableArray *tileMatrix;
@property (nonatomic, strong) NSMutableArray *row;
@property (nonatomic, strong) CSpriteNode *spriteNode;
@property (nonatomic, strong) CTextureAtlas *textureAtlas;
@property (nonatomic, strong) CSceneManager *manager;
@property (nonatomic, strong) CLayer *layer;

- (void)moveTilesX:(float)x y:(float)y;

@end

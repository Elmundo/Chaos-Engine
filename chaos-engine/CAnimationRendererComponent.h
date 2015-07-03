//
//  CAnimationRendererComponent.h
//  ChaosGame
//
//  Created by Baris YILMAZ on 01/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CRendererComponent.h"
#import <TBXML.h>
#import "CRect.h"

@interface CAnimationRendererComponent : CRendererComponent
{
    TBXML *_tbxml;
    TBXMLElement *_rootElement;
}
/* OUTSIDE PROPERTIES */
@property (nonatomic, strong) NSString *atlasName;

/* INNER PROPERTIES */
@property (nonatomic, strong) NSMutableDictionary *animationDic;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, assign) int width;
@property (nonatomic, assign) int height;

/* METHODS */
- (NSArray *)animationWithName:(NSString *)animationName;

@end

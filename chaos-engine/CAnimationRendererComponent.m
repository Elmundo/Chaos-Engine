//
//  CAnimationRendererComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 01/07/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CAnimationRendererComponent.h"

@implementation CAnimationRendererComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
}

/* Override */
- (void)render
{
    NSError *error;
    _tbxml = [TBXML tbxmlWithXMLFile:_atlasName error:&error];
    _rootElement = _tbxml.rootXMLElement;
    
    _animationDic = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    [self traverseElement:_rootElement];
    
    SKTexture *firstTexture;
    for (NSString *key in _animationDic) {
        NSArray *list = [_animationDic objectForKey:key];
        firstTexture = [list objectAtIndex:0];
        break;
    }
    
    self.spriteNode = [CSpriteNode spriteNodeWithTexture:firstTexture];
    [self.layer addChild:self.spriteNode];
}

- (NSArray *)animationWithName:(NSString *)animationName
{
    return [_animationDic objectForKey:animationName];
}

#pragma mark XML Parser
- (void)traverseElement:(TBXMLElement *)element
{
    
    if (element == nil)
        return;
    
    NSError *error;
    if ([[TBXML elementName:element] isEqualToString:@"atlas"]) {
        _imagePath = [TBXML valueOfAttributeNamed:@"imagePath" forElement:element error:&error];
        _width = [[TBXML valueOfAttributeNamed:@"width" forElement:element] integerValue];
        _height = [[TBXML valueOfAttributeNamed:@"height" forElement:element] integerValue];
        
        [self traverseElement:element->firstChild];
    }
    
    else if ([[TBXML elementName:element] isEqualToString:@"animation"]) {
        
        NSMutableArray *textureList = [[NSMutableArray alloc] init];
        NSString *animationName = [TBXML valueOfAttributeNamed:@"name" forElement:element];
        
        CGRect eulerRect;
        CGRect unitRect;
        SKTexture *texture;
        int x,y,w,h = 0;
        
        TBXMLElement *textureElement = element->firstChild;
        while (textureElement) {
            x = [[TBXML valueOfAttributeNamed:@"x" forElement:textureElement] integerValue];
            y = [[TBXML valueOfAttributeNamed:@"y" forElement:textureElement] integerValue];
            w = [[TBXML valueOfAttributeNamed:@"w" forElement:textureElement] integerValue];
            h = [[TBXML valueOfAttributeNamed:@"h" forElement:textureElement] integerValue];
            
            eulerRect = CGRectMake(x, y, w, h);
            unitRect = [CUtil eulerToUnit:eulerRect andResourceSize:CGSizeMake(_width, _height)];
            
            texture = [SKTexture textureWithRect:unitRect inTexture:self.sourceTexture];
            [textureList addObject:texture];
            
            textureElement = textureElement->nextSibling;
        }
        
        if (textureList.count > 0) {
            [_animationDic setObject:textureList forKey:animationName];
        }
        
        [self traverseElement:element->nextSibling];
    }
}

@end

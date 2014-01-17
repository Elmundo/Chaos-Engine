//
//  CAnimationComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 1/17/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CAnimationComponent.h"

@implementation CAnimationComponent

- (void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _animationDic = [NSMutableDictionary dictionary];
    
    // Texture Atlas is not working!
    /*
    _textureAtlas = [SKTextureAtlas atlasNamed:_atlasName];
    if (_textureAtlas == nil) {
        [CLogger errorWithTarget:self method:@"didAddedToEntity"
                         message:@"textureAtlas is nil."];
        return;
    }
    */
    
    SKTexture *texture;
    for (NSString *animationName in _animationList) {
        
        NSMutableArray *textureList = [NSMutableArray array];
        NSString *finalName;
        
        NSNumber *animationNum = [_animationList objectForKey:animationName];
        for (int i=1; i <= [animationNum intValue]; i++) {
            
            NSString *indexInStr = kAppendStr(kAppendStr(@"0", [[NSNumber numberWithInt:i] stringValue]), kFormat);
            //NSString *indexInStr = kAppendStr(@"0", [[NSNumber numberWithInt:i] stringValue]);
            finalName = kAppendStr(kAppendStr(kAppendStr(kAppendStr(_atlasName, @"_"), animationName), @"_"),indexInStr);
            //texture = [_textureAtlas textureNamed:finalName];
            texture = [SKTexture textureWithImageNamed:finalName];
            [CLogger logWithTarget:self method:@"didAddedToEntity:" message:kAppendStr(finalName, @" size is ")];
            NSLog(@"width= %f  height= %f", texture.size.width, texture.size.height);
            [textureList addObject:texture];
        }
        
        //Animation texture list added to animation map - you could call
        [_animationDic setValue:textureList forKey:animationName];
    }
}

- (void)playAnimationWithName:(NSString *)animationName
{
    if([self.renderRef respondsToSelector:@selector(spriteNode)])
    {
        [CLogger logWithTarget:self method:@"playAnimationWithName" message:kAppendStr(@"animation Name is ", animationName)];
        __block int index = 1;
        NSArray *textureList = [_animationDic objectForKey:animationName];

        __block SKSpriteNode *sprite = [_renderRef performSelector:@selector(spriteNode)];
        
        SKAction *action = [SKAction runBlock:^{
            sprite.texture = [textureList objectAtIndex:index];
            sprite.size = sprite.texture.size;
            index++;
            if (textureList.count - 1 <= index) {
                index = 1;
            }
        }];
        
        SKAction *wait = [SKAction waitForDuration:0.5];
        
        SKAction *sequence = [SKAction sequence:@[action, wait]];
        SKAction *repeat = [SKAction repeatActionForever:sequence];
        
        [sprite runAction:repeat completion:^{
            NSLog(@"Finished.");
        }];
        /*
         SKSpriteNode *sprite = [_renderRef performSelector:@selector(spriteNode)];
        [CLogger logWithTarget:self method:@"playAnimationWithName" message:kAppendStr(@"animation Name is ", animationName)];
        NSArray *textureList = [_animationDic objectForKey:animationName];
        _animationAction = [SKAction animateWithTextures:textureList timePerFrame:0.1];
        
        SKAction *repeat = [SKAction repeatAction:_animationAction count:20];
        
        SKAction *finalAction = [SKAction customActionWithDuration:10 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
            SKSpriteNode *sp = (SKSpriteNode *)node;
            sp.size = sp.texture.size;
        }];
        
        SKAction *group = [SKAction group:@[finalAction, repeat]];
        
        [sprite runAction:group completion:^{
            NSLog(@"Action is over.");
        }];
         */
    }else
    {
        [CLogger logWithTarget:self method:@"playAnimationWithName" message:@"SpriteNode is not ready yet!"];
    }
}

- (void)didRemovedFromEntity
{
    [self didRemovedFromEntity];
}

@end

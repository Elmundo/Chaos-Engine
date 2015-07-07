//
//  CCameraComponent.m
//  ChaosGame
//
//  Created by Baris YILMAZ on 4/28/14.
//  Copyright (c) 2014 Baris YILMAZ. All rights reserved.
//

#import "CCameraComponent.h"

@interface CCameraComponent()

@property (nonatomic, assign) CGPoint offset;
@property (nonatomic, assign) CGSize screenSize;
@property (nonatomic, assign) CGFloat widthHalf;
@property (nonatomic, assign) CGFloat heightHalf;

@end

@implementation CCameraComponent

-(void)didAddedToEntity:(CEntity *)owner
{
    [super didAddedToEntity:owner];
    
    _layers         = [[NSMutableArray alloc] init];
    _sceneManager   = [CSceneManager shared];
    _screenSize     = [CEngine shared].screenSize;
    _widthHalf      = _screenSize.width/2;
    _heightHalf     = _screenSize.height/2;
    _offset = CGPointMake(0.f, 0.f);
    
    for (NSString *layerName in _layerNameList) {
        CLayer *layer = [_sceneManager getLayerWithName:layerName];
        [_layers addObject:layer];
    }
    
    // There is entity to follow
    if (self.objectToFollowProperty) {
        self.positionComponent = [self.objectToFollowProperty getPropertyWithEntity:nil];
        [self setCameraPositionWithX:self.positionComponent.position.x andY:self.positionComponent.position.y];
        [self.positionComponent addEventListener:@selector(onPositionChange:)
                                         message:[CPositionEvent CE_PositionChanged]
                                       component:self];
    }else{
        [self setCameraPositionWithX:_offset.x andY:_offset.y];
    }
}

-(void)didRemovedFromEntity
{
    [super didRemovedFromEntity];
    
    [_layers removeAllObjects];
    _sceneManager = nil;
    _layers = nil;
}

#pragma mark - Camera Movement
- (void)moveCameraWithX:(int)diffX andY:(int)diffY
{
    _offset.x += diffX;
    _offset.y += diffY;
    [self _setPosition:_offset];
}

- (void)setCameraPositionWithX:(int)x andY:(int)y
{
    _offset.x = x;
    _offset.y = y;
    [self _setPosition:_offset];
}

#pragma mark - Callback methods
- (void)onPositionChange:(CPositionEvent *)event
{
    CPoint *objectToFollowPos = event.position;
    _offset.x = objectToFollowPos.x;
    _offset.y = objectToFollowPos.y;
    [self setCameraPositionWithX:_offset.x andY:_offset.y];
}

#pragma mark - Inline Methods
- (void)_setPosition:(CGPoint)offset
{
    for (CLayer *layer in _layers) {
        
        CGFloat x       = _widthHalf - offset.x;
        CGFloat y       = _heightHalf - offset.y;
        layer.position  = CGPointMake(x, y);
    }
}

@end

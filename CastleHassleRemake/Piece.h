//
//  Piece.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

@class PlayerArea;

@interface Piece : NSObject{
    
    b2Body *body;
    b2World *world;
}

-(id) initWithWorld:(b2World*)w coords:(CGPoint)p;
-(void) setupSpriteWithRect:(CGRect)rect image:(NSString*)image atPoint:(CGPoint)p;
-(int) zIndex;
-(int) zFarIndex;
-(void) finalizePiece;
-(void) finalizePieceBase;



@property(nonatomic) b2Body *body;
@property(nonatomic) b2World *world;

@property(nonatomic, assign) PlayerArea *owner;

@property(nonatomic, retain) CCSprite* currentSprite;
@property(nonatomic, retain) CCSprite* backSprite;


@end

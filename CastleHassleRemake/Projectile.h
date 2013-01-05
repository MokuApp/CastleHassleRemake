//
//  Projectile.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PlayerArea.h"
#import "Piece.h"
#import "Box2D.h"

@interface Projectile : Piece {
    
}

-(id) initWithCoords:(CGPoint)p world:(b2World*)w from:(PlayerArea*)s;
-(void)updateSpritePosition:(b2Vec2)pos body:(b2Body*)b;

+(float) getMass;

@end

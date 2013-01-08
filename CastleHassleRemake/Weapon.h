//
//  Weapon.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Piece.h"
#import "Box2D.h"

@interface Weapon : Piece {
    float offset;
    float cooldown;
    float maxCooldown;
}

@property(nonatomic) float offset;
@property(nonatomic) float cooldown;
@property(nonatomic, readonly) float maxCooldown;

@property(nonatomic, retain) CCSprite *cdSprite;

-(void) updateSpritesAngle:(float)ang position:(b2Vec2)pos time:(float)t;


@end

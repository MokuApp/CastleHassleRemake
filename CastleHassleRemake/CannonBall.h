//
//  CannonBall.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Projectile.h"
#import "Box2D.h"

@interface CannonBall : Projectile {
    
}

-(id)initWithWorld:(b2World *)w coords:(CGPoint)p shooter:(PlayerArea*)s;

@end

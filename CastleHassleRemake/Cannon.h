//
//  Cannon.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "SimpleAudioEngine.h"

@interface Cannon : Weapon

-(id) initWithWorld:(b2World *)w coords:(CGPoint)p;
-(BOOL) shootFromAICannon:(CGPoint)touch;
-(BOOL) setCannonBall:(CGPoint)touch;

@end

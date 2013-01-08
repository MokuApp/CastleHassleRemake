//
//  Weapon.mm
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import "Weapon.h"
#import "PlayerArea.h"
#import "AI.h"
#import "Battlefield.h"

@implementation Weapon


@synthesize offset,cdSprite,cooldown,maxCooldown;

-(id)init{
    
    if ((self = [super init])) {
        cooldown = 0;
        maxCooldown = 5;
    }
    return self;
}



-(void) updateSpritesAngle:(float)ang position:(b2Vec2)pos time:(float)t{
    
    if (self.cooldown > 0) {
        self.cooldown -= t;
        
        if (self.cooldown <= 0 && self.owner) {
            
            self.cooldown = 0;
            
            if (self.owner.ai) {
                [self.owner.ai readyToFire:self];
            }            
        }
    }
    
}


@end

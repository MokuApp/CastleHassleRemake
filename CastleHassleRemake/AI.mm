//
//  AI.m
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import "AI.h"
#import "Weapon.h"
#import "Cannon.h"
#import "PlayerArea.h"
#import "PlayerAreaManager.h"
#import "Battlefield.h"
#import "CannonBall.h"

@implementation AI

+(id) aiWithPlayer:(PlayerArea *)p{
    
    return [[[self alloc] initWithPlayer:p] autorelease];
}


-(id)initWithPlayer:(PlayerArea *)p{
    
    if ((self = [super init])) {
        playerArea = p;
        NSString* file = @"player";
        [[Battlefield instance] loadForPlayer:p file:file];
    }
    return self;
}

-(void) readyToFire:(Weapon *)w{
    
    float Xo = 0;
    float Yo = 0;
    float Mc = 0;
    float W = 0;
    float H = 0;
    float alpha = 45;
    float Xt = 0;
    float Yt = 0;
    float d = 0;
    float V = 0;
    float F = 0;
    float g = -[Battlefield instance].world->GetGravity().y;    
    
    if ([w isKindOfClass:[Weapon class]]) {
        
        b2Vec2 weaponPos = w.body->GetPosition();
        CGPoint shootingFrom = CGPointMake(weaponPos.x, weaponPos.y);
        
        Xo = shootingFrom.x;
        Yo = shootingFrom.y;
        
        d = fabs(Xt-Xo);
        float Yoffset = (Yt-Yo);

        Mc = [CannonBall getMass];
        
        alpha = CC_DEGREES_TO_RADIANS(45);
        
        V = ((g*pow((d), 2)*(1+pow(tan(alpha),2)))/(2*((d)*tan(alpha)-(Yoffset))));
        V = sqrt(V);
        
        F = V*Mc;
        
        if ((Xt-Xo)>0) {
            H = F*sin(alpha);
            W = F*cos(alpha);
        }else{
            H = F*sin(alpha);
            W = -F*cos(alpha);
        }

        
        if ([w isKindOfClass:[Cannon class]]) {
            [(Cannon*)w shootFromAICannon:ccp(W/CANNON_DEFAULT_POWER, H/CANNON_DEFAULT_POWER)];
        }
        
    }
    
}

@end

//
//  Projectile.mm
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import "Projectile.h"


@implementation Projectile


-(id) initWithCoords:(CGPoint)p world:(b2World *)w from:(PlayerArea *)s{
    
    if ((self = [super initWithWorld:w coords:p])) {
        world = w;
        self.owner = s;
        
        b2BodyDef bodyDef;
        bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
        bodyDef.userData = self;
        
        body = w->CreateBody(&bodyDef);
        body->SetType(b2_dynamicBody);
        body->SetBullet(true);
    }
    return self;
}


-(void)updateSpritePosition:(b2Vec2)pos body:(b2Body *)b{
    
    
    
}

+(float) getMass{
    return 1.0f;
}

@end

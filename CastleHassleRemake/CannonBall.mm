//
//  CannonBall.mm
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import "CannonBall.h"
#import "Battlefield.h"
#import "PlayerArea.h"

@implementation CannonBall

-(id) initWithWorld:(b2World *)w coords:(CGPoint)p shooter:(PlayerArea *)s{
    
    if ((self = [super initWithCoords:p world:w from:s])) {
        
        [self setupSpriteWithRect:CGRectMake(0, 0, 7, 7) image:CANNONBALL_IMAGE atPoint:p];
        
        b2PolygonShape dynamicBox;
        
        dynamicBox.SetAsBox(7.0/PTM_RATIO*.5, 7.0/PTM_RATIO*.5);
        
        b2FixtureDef fixtureDef;
        fixtureDef.shape = &dynamicBox;
        fixtureDef.density = CANNONBALL_DENSITY;
        fixtureDef.friction = 0.1f;
        fixtureDef.filter.groupIndex = -1;
        body->CreateFixture(&fixtureDef);
        
        
    }
    return self;
    
}

+(float)getMass{
    
    return 7.0*7.0/(PTM_RATIO*PTM_RATIO)*CANNONBALL_DENSITY;
}

@end

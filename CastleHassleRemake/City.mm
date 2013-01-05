//
//  City.m
//  CastleHassleRemake
//
//  Created by tedant on 13/01/01.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import "City.h"
#import "PlayerArea.h"
#import "Battlefield.h"

@implementation City

-(id)initWithCoords:(CGPoint)p owner:(PlayerArea *)o colorVal:(ccColor3B)color{
    
    
    if ((self = [super initWithWorld:[Battlefield instance].world coords:p])) {
        
        
        CGRect rect = CGRectMake(0, 0, 420, 60);
        [self setupSpriteWithRect:rect image:CITY_IMAGE atPoint:p];
        
        //Define the dynamic body
        b2BodyDef bodyDef;
        bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
        bodyDef.userData = self;
        body = world->CreateBody(&bodyDef);
        
        //Define box shape for dynamic body
        b2PolygonShape dynamicBox;
        
        b2Vec2 wedge[4];
        wedge[0] = b2Vec2(210.0/PTM_RATIO, -30.0/PTM_RATIO);
        wedge[1] = b2Vec2(150.0/PTM_RATIO, 30.0/PTM_RATIO);
        wedge[2] = b2Vec2(-150.0/PTM_RATIO, 30.0/PTM_RATIO);
        wedge[3] = b2Vec2(-210.0/PTM_RATIO, -30.0/PTM_RATIO);
        dynamicBox.Set(wedge, 4);
        
        //Define the dynamic body fixture
        b2FixtureDef fixtureDef;
        fixtureDef.shape = &dynamicBox;
        body->CreateFixture(&fixtureDef);
        body->SetUserData(self);
        body->SetType(b2_staticBody);
        
        
    }
    return self;
}

@end

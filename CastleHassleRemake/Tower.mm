//
//  Tower.m
//  CastleHassleRemake
//
//  Created by tedant on 12/12/29.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import "Tower.h"

@implementation Tower

-(id)initWithWorld:(b2World *)w coords:(CGPoint)p{
    
    if ((self = [super init])) {
        
        world = w;
        
        [self setupSpriteWithRect:CGRectMake(0, 0, 30, 29) image:TOWER_IMAGE atPoint:p];
        
        //Define the dynamic body
        b2BodyDef bodyDef;
        bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
        bodyDef.userData = self;
        body = world->CreateBody(&bodyDef);
        body->SetType(b2_dynamicBody);
        
    }
    return self;
}

-(void) finalizePiece{
    
    b2PolygonShape dynamicBox;
    dynamicBox.SetAsBox(28.0/PTM_RATIO*.5, 28.0/PTM_RATIO*.5);
    
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &dynamicBox;
    fixtureDef.density = PIECE_DENSITY;
    fixtureDef.friction = 1.3f;
    body->CreateFixture(&fixtureDef);
    
    [super finalizePiece];
}

@end

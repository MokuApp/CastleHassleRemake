//
//  Cannon.m
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import "Cannon.h"
#import "CannonBall.h"
#import "Battlefield.h"

@implementation Cannon

-(id)initWithWorld:(b2World *)w coords:(CGPoint)p{
    
    if ((self = [super init])) {
        
        offset = 10.0;
        world = w;
        
        [self setupSpriteWithRect:CGRectMake(0, 26, 30, 14) image:CANNON_IMAGE atPoint:p];
        
        b2BodyDef bodyDef;
        bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
        bodyDef.userData = self;
        body = world->CreateBody(&bodyDef);
        
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"cannon.caf"];
        
    }
    return self;
}

-(BOOL) shootFromAICannon:(CGPoint)touch{
    
    [self setCannonBall:touch];
    return YES;
}

-(BOOL)setCannonBall:(CGPoint)touch{

    [[SimpleAudioEngine sharedEngine] playEffect:@"cannon.caf"];
    
    float pixelsInFront = 30.0;
    
    CGPoint projectitleLoc = CGPointMake((float)self.currentSprite.position.x, (float)self.currentSprite.position.y);
    
    float h = touch.y - 0.0;
    float w = touch.x - 0.0;
    
    if (WEAPON_MAX_POWER < fabs(h)+fabs(w)) {
        
        h = WEAPON_MAX_POWER*(h/(fabs(h)+fabs(w)));
        w = WEAPON_MAX_POWER*(w/(fabs(h)+fabs(w)));
    }
    
    float power = b2Vec2(w,h).Length();
    
    if (h<0.0) {
        h = 0.0;
    }
    
    projectitleLoc.x += (w/power)*pixelsInFront;
    projectitleLoc.y += (h/power)*pixelsInFront;
    
    CannonBall *ball = [[[CannonBall alloc] initWithWorld:world coords:projectitleLoc shooter:self.owner] autorelease];
    [[Battlefield instance] addProjectileToBin:ball];
    
    ball.body->ApplyLinearImpulse(b2Vec2(w*CANNON_DEFAULT_POWER/3, h*CANNON_DEFAULT_POWER/3), ball.body->GetPosition());

    
    return YES;
}


-(void)finalizePiece{
    
    b2PolygonShape dynamicBox;
    
    dynamicBox.SetAsBox(30.0/PTM_RATIO*.5, 25.0/PTM_RATIO*.5, b2Vec2(0, offset/(1.5*PTM_RATIO)), 0);
    
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &dynamicBox;
    fixtureDef.density = PIECE_DENSITY;
    fixtureDef.friction = 1.0f;
    body->CreateFixture(&fixtureDef);
    
    [super finalizePiece];
}

@end

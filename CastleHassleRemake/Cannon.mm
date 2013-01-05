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
    
    //[self prepareShootIndicator:ccp(0,0)];
    //[self shootIndicator:touch];
    [self setCannonBall:touch];
    return YES;
}

-(BOOL)setCannonBall:(CGPoint)touch{
    /*
    if (self.shootIndicatorTrail) {
        [[Battlefield instance] removeChild:self.shootIndicatorTrail cleanup:YES];
    }
    
    if (self.shootIndicatorTop) {
        [[Battlefield instance] removeChild:self.shootIndicatorTop cleanup:YES];
    }
    
    self.shootIndicatorTrail = nil;
    self.shootIndicatorTop = nil;
    */
    [[SimpleAudioEngine sharedEngine] playEffect:@"cannon.caf"];
    
    CGPoint projectitleLoc = CGPointMake((float)self.currentSprite.position.x, (float)self.currentSprite.position.y);
    
    CannonBall *ball = [[[CannonBall alloc] initWithWorld:world coords:projectitleLoc shooter:self.owner] autorelease];
    [[Battlefield instance] addProjectileToBin:ball];

    
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

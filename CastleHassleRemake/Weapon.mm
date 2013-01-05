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


@synthesize offset,shootIndicatorTop,shootIndicatorTrail,cdSprite;

-(id)init{
    
    if ((self = [super init])) {
           
    }
    return self;
}



-(void) updateSpritesAngle:(float)ang position:(b2Vec2)pos time:(float)t{
    
    if (self.owner.ai) {
        [self.owner.ai readyToFire:self];
    }
}


-(void) prepareShootIndicator:(CGPoint)touch{
    /*
    self.shootIndicatorTrail = sprite(@"shootIndicatorTail.png");
    self.shootIndicatorTop = sprite(@"shootIndicatorTop.png");
    
    self.shootIndicatorTrail.position = self.currentSprite.position;
    self.shootIndicatorTop.position = touch;
    
    self.shootIndicatorTrail.anchorPoint = ccp(0.5,0);
    self.shootIndicatorTop.anchorPoint = ccp(0.5,0);
    
    [self.shootIndicatorTrail setScaleY:(1/130.0)];
    
    self.shootIndicatorTop.visible = NO;
    self.shootIndicatorTrail.visible = NO;
    
    [[Battlefield instance] addChild:self.shootIndicatorTrail z:6];
    [[Battlefield instance] addChild:self.shootIndicatorTop z:6];
     */
}

-(void)shootIndicator:(CGPoint)touch{
    /*
    self.shootIndicatorTop.visible = YES;
    self.shootIndicatorTrail.visible = YES;
     */
}

@end

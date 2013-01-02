//
//  Piece.m
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import "Piece.h"
#import "Battlefield.h"

@implementation Piece

@synthesize owner,currentSprite,backSprite;

-(id) initWithWorld:(CGPoint)p{
    
    if ((self = [super init])) {
        backSprite = nil;
        owner = nil;
    }
    return self;
}

-(int)zIndex{
    return PIECE_Z_INDEX;
}

-(int)zFarIndex{
    return FAR_PIECE_Z_INDEX;
}

-(void)setupSpriteWithRect:(CGRect)rect image:(NSString *)image atPoint:(CGPoint)p{
    
    self.currentSprite = spriteWithRect(image, rect);
    [[Battlefield instance] addChild:currentSprite z:[self zIndex]];
    currentSprite.position = ccp(p.x, p.y);
    /*
    self.backSprite = spriteWithRect(image, rect);
    [backSprite setScale:1/BACKGROUND_SCALE_FACTOR];
    [[Battlefield instance] addChild:backSprite z:[self zFarIndex]];
    backSprite.position = ccp(p.x, p.y + PLAYER_BACKGROUND_HEIGHT);
    backSprite.flipX = YES;
    */
}

@end

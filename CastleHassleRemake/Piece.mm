//
//  Piece.m
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import "Piece.h"
#import "Battlefield.h"
#import "PlayerArea.h"

@implementation Piece

@synthesize owner,currentSprite,backSprite,world,body;

-(id)initWithWorld:(b2World *)w coords:(CGPoint)p{
    
    if ((self = [super init])) {
        world = w;
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
    
}

-(void) finalizePiece{
    [self finalizePieceBase];
}

-(void) finalizePieceBase{
    body->SetType(b2_dynamicBody);
    body->SetAwake(true);
    
}


@end

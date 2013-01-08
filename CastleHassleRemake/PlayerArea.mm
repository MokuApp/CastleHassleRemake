//
//  PlayerArea.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "PlayerArea.h"
#import "AI.h"

@implementation PlayerArea

@synthesize ai,city,pieces,left;

-(id)initWithLeft:(float)l dimentions:(CGPoint)dim{
    
    
    if ((self = [super init])) {
        left = l;
        self.ai = nil;
        self.pieces = [NSMutableArray array];

        

    }
    return self;
}


-(void)makeCityWithColor:(ccColor3B)color{
    self.city = [[[City alloc] initWithCoords:ccp(left+(PLAYER_GROUND_WIDTH/2), PLAYER_GROUND_HEIGHT) owner:self colorVal:color] autorelease];
    [self addPiece:city];
}

-(void)addPiece:(Piece *)piece{
    
    [pieces addObject:piece];
    piece.owner = self;
    
}

@end

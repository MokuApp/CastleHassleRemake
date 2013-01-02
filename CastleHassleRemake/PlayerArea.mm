//
//  PlayerArea.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "PlayerArea.h"


@implementation PlayerArea

@synthesize city;

-(id)initWithLeft:(float)left dimentions:(CGPoint)dim{
    
    
    if ((self = [super init])) {

    }
    return self;
}


-(void)makeCityWithColor:(ccColor3B)color{
    self.city = [[[City alloc] initWithCoords:ccp(PLAYER_GROUND_WIDTH/2, PLAYER_GROUND_HEIGHT) owner:self colorVal:color] autorelease];
    
}

@end

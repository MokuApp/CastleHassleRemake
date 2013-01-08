//
//  PlayerAreaManager.m
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//
#import "PlayerArea.h"
#import "PlayerAreaManager.h"
#import "Battlefield.h"
#import "AI.h"

@implementation PlayerAreaManager

@synthesize playerAreas;


-(id)initWithPlayerAreaWorld{
    
    
    if ((self = [super init])) {
        
        playerAreas = [[NSMutableArray alloc] initWithCapacity:2];
        
        
        BOOL makeCity = NO;
        
        for (uint i=0; i<2; i++) {
            BOOL indexIsPlayer = i == 0;
//            if (indexIsPlayer) {
                makeCity = YES;
 //           }
            
            PlayerArea* playerArea = [[[PlayerArea alloc] initWithLeft:PLAYER_GROUND_WIDTH*i 
                                                            dimentions:CGPointMake(PLAYER_GROUND_WIDTH, PLAYER_GROUND_HEIGHT)] 
                                      autorelease];
            
            if (makeCity) {
                [playerArea makeCityWithColor:(ccColor3B){21,140,202}];
            }
            
            [playerAreas addObject:playerArea];
            
        }

        
    }
    return self;
}


-(void)loadPlayer{
    
//    NSString* file = @"player";
    for (uint i = 0; i < 2; i++) {
        BOOL indexIsPlayer = i == 0;
        if (indexIsPlayer) {
            PlayerArea* pa = [playerAreas objectAtIndex:i];
            pa.ai = [AI aiWithPlayer:pa];
            //[[Battlefield instance] loadForPlayer:pa file:file];
        }
    }
}

-(void) addPiece:(Piece *)p forPlayer:(PlayerArea *)pa{
    [pa addPiece:p];
}

-(PlayerArea*) getEnemyPlayerArea{
    return [playerAreas objectAtIndex:1];
}


@end

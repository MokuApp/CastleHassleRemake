//
//  PlayerArea.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Piece.h"
#import "SimpleAudioEngine.h"
#import "City.h"

@class AI;

@interface PlayerArea : Piece {

    float left;
}


@property(nonatomic) float left;

@property(nonatomic,retain) AI* ai;
@property(nonatomic,retain) City* city;
@property(nonatomic,retain) NSMutableArray* pieces;


-(id)initWithLeft:(float)left dimentions:(CGPoint)dim;
-(void) makeCityWithColor:(ccColor3B)color;
-(void)addPiece:(Piece*)piece;

@end

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

@interface PlayerArea : Piece {

}


@property(nonatomic,retain) City* city;

-(id)initWithLeft:(float)left dimentions:(CGPoint)dim;
-(void) makeCityWithColor:(ccColor3B)color;


@end

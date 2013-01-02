//
//  City.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/01.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Piece.h"

@interface City : Piece{
    
}

-(id)initWithCoords:(CGPoint)p owner:(PlayerArea*)o colorVal:(ccColor3B)color;

@end

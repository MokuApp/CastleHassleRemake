//
//  City.m
//  CastleHassleRemake
//
//  Created by tedant on 13/01/01.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import "City.h"
#import "PlayerArea.h"
#import "Battlefield.h"

@implementation City

-(id)initWithCoords:(CGPoint)p owner:(PlayerArea *)o colorVal:(ccColor3B)color{
    
    
    if ((self = [super initWithWorld:p])) {
        
        
        CGRect rect = CGRectMake(0, 0, 420, 60);
        [self setupSpriteWithRect:rect image:CITY_IMAGE atPoint:p];
    }
    return self;
}

@end

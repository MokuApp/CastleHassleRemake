//
//  Tower.m
//  CastleHassleRemake
//
//  Created by tedant on 12/12/29.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import "Tower.h"

@implementation Tower

-(id)initWithWorld:(CGPoint)p{
    
    if ((self = [super init])) {
        
        [self setupSpriteWithRect:CGRectMake(0, 0, 30, 29) image:TOWER_IMAGE atPoint:p];
        
    }
    return self;
}

@end

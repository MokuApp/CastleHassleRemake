//
//  Background.m
//  CastleHassleRemake
//
//  Created by tedant on 12/12/22.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import "Background.h"

@implementation Background

@synthesize imageA,imageB, parallaxFactor;

-(id)initWithLeftImage:(NSString *)lImg 
            rightImage:(NSString *)rImg 
        imageDimension:(CGPoint)dim 
                 layer:(CCLayer *)parent 
                 index:(int)index 
        parallaxFactor:(float)pf{
    
    if ((self = [super init])) {
        
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        self.imageA = spriteWithRect(lImg, CGRectMake(0, 0, dim.x, dim.y));
        self.imageA.position = ccp(-1*dim.x/2+screenSize.width/2, dim.y/2);
        self.imageA.anchorPoint = ccp(0, .5);
        [parent addChild:self.imageA z:index];
        
        self.imageB = spriteWithRect(rImg, CGRectMake(0, 0, dim.x, dim.y));
        self.imageB.position = ccp(dim.x/2+screenSize.width/2-1, dim.y/2);
        self.imageB.anchorPoint = ccp(0, .5);
        [parent addChild:self.imageB z:index];
        
    }
    
}

@end

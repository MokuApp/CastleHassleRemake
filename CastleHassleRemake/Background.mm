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
        
        parallaxFactor = pf;
        
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
    return self;
}

-(float) getExtremeLeft{
    
    return MIN(imageA.position.x, imageB.position.x);
}

-(float) getExtremeRight{
    return MAX(imageA.position.x + imageA.textureRect.size.width, imageB.position.x + imageB.textureRect.size.width);
}

-(CCSprite*) getUnseenSprite:(CGPoint)pos result:(int)res{
    
    if (res >0) {
        return imageA.position.x < imageB.position.x ? imageA : imageB;
    } else {
        return imageA.position.x > imageB.position.x ? imageA : imageB;
    }
}

-(int)cameraOutOfBounds:(CGPoint)pos{
    
    float screenWidth = MAX([CCDirector sharedDirector].winSize.width, [CCDirector sharedDirector].winSize.height);
    
    float extremeLeft = [self getExtremeLeft];
    float extremeRight = [self getExtremeRight];
    
    if(pos.x < extremeLeft){
        return -1;
    }
    if (pos.x > extremeRight - screenWidth) {
        return 1;
    }
    return 0;
    
}

-(void)repositionSprite:(CGPoint)pos result:(int)res{
    
    CCSprite *sprite = [self getUnseenSprite:pos result:res];
    sprite.position = ccp(sprite.textureRect.size.width * 2 * res + (-2 * res) + sprite.position.x, sprite.position.y);
}

-(void)positionForCameraLoc:(CGPoint)loc{
    
    int res;
    if ((res = [self cameraOutOfBounds:loc])) {
        [self repositionSprite:loc result:res];
    }
    
}

@end

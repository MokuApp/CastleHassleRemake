//
//  Background.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/22.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Background : NSObject{
    
    float parallaxFactor;
}


@property(nonatomic) float parallaxFactor;
@property(nonatomic, retain) CCSprite* imageA;
@property(nonatomic, retain) CCSprite* imageB;

-(id)initWithLeftImage:(NSString*)lImg 
            rightImage:(NSString*)rImg 
        imageDimension:(CGPoint)dim layer:(CCLayer*)parent 
                 index:(int)index 
        parallaxFactor:(float)pf;


-(int) cameraOutOfBounds:(CGPoint)pos;
-(void)positionForCameraLoc:(CGPoint)loc;
-(void)repositionSprite:(CGPoint)pos result:(int)res;

@end

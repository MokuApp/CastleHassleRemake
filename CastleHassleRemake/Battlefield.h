//
//  Battlefield.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/21.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface Battlefield : CCLayer {
    
    CGPoint initialTouch;
    float screenMomentum;
}


@property(nonatomic, retain) NSMutableArray *tileables;


+(Battlefield*)instance;


-(void)tileImagePool:(CGPoint)loc delta:(CGPoint)d;
-(void)moveScreen;

-(CGPoint) transformTouchesToPoint:(NSSet*)touches withCameraOffset:(BOOL)cam;

@end

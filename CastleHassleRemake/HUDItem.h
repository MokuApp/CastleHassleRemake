//
//  HUDItem.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/28.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HUDItem : NSObject {
    
    int leftBound;
    int rightBound;
    CCSprite* img;
}

@property(nonatomic, retain) NSString *imageName;
@property(nonatomic, retain) CCSprite* img;
@property(nonatomic) int leftBound;
@property(nonatomic) int rightBound;

-(void)hideWithAnimations:(BOOL)animation;
-(void)show;

-(void)move:(CGPoint)p;
-(BOOL)handleInitialTouch:(CGPoint)p;

@end

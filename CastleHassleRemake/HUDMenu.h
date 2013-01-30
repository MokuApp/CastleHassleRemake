//
//  HUDMenu.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/28.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class HUDItem,ButtonItem;

@interface HUDMenu : NSObject {
    float extremeRight;
}

@property(nonatomic, retain) HUDItem *selected;
@property(nonatomic, retain) NSMutableArray* items;

-(HUDItem*) getHUDItem:(CGPoint)p;

-(void)moveAllObjects:(CGPoint)p;


-(ButtonItem*) addButtonItemWithImageName:(NSString*)imageName imageBox:(CGRect)box 
                            swingImageBox:(CGRect)swingBox selector:(SEL)s title:(NSString*)t;

-(void) addItemWithImageName:(NSString*)imageName imageBox:(CGRect)box 
               swingImageBox:(CGRect)swingBox hudItem:(HUDItem*)item expandToStatusSize:(BOOL)expand;



-(void)showAll;
-(void)hideAll;


-(BOOL)handleInitialTouch:(CGPoint)p;

-(CGRect) hudRect;

@end

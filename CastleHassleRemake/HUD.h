//
//  HUD.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/27.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class HUDMenu;



@interface HUD : CCLayer {
    
    BOOL menuIsHidden;
}

@property(nonatomic, retain) HUDMenu *mainMenu;
@property(nonatomic, retain) HUDMenu *buildMenu;
@property(nonatomic, retain) HUDMenu *inFocus;

@property(nonatomic, retain) CCSprite *tabUpSprite;
@property(nonatomic, retain) CCSprite *tabSprite;
@property(nonatomic, retain) CCSprite *tabDownSprite;

-(void)initMainMenu;
-(void)initBuildMenu;

-(void) showMenu:(HUDMenu*)menu;
-(void) showMainMenu;
-(void) showBuildMenu;
-(void) showSettings;

-(void) hideMenu;

-(void) moveAllObjects:(CGPoint)p;
-(BOOL) handleInitialTouch:(CGPoint)p;


-(CGRect) tabRect;


@end

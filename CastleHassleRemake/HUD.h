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
    
}

@property(nonatomic, retain) HUDMenu *mainMenu;
@property(nonatomic, retain) HUDMenu *inFocus;

@property(nonatomic, retain) CCSprite *tabUpSprite;
@property(nonatomic, retain) CCSprite *tabSprite;
@property(nonatomic, retain) CCSprite *tabDownSprite;

-(void)initMainMenu;


-(void) showMenu:(HUDMenu*)menu;
-(void) showMainMenu;
-(void) showBuildMenu;
-(void) showSetting;

-(void) hideMenu;

-(void) moveAllObjects:(CGPoint)p;


@end

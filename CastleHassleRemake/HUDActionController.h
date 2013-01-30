//
//  HUDActionController.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/30.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HUD;

@interface HUDActionController : NSObject{
    HUD *hud;
}

@property(nonatomic, retain) HUD *hud;

+(HUDActionController*) instance;

-(void)showMainMenu;
-(void)showBuildMenu;
-(void)showSettings;

@end

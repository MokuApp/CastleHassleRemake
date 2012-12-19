//
//  MainMenu.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/18.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseMenu.h"
#import "SimpleAudioEngine.h"
#define MAIN_MENU_LAYER 101

@interface MainMenu : CCScene {
    
}

@property(nonatomic,retain) CCSprite* bg;

+(MainMenu*)instance;
+(void)resetInstance;

@end


@interface MainMenuLayer : BaseMenu {
    CCSprite* bg;
}


-(void)singlePlayer: (id)sender;
-(void)settings: (id)sender;
-(void)howToPlay: (id)sender;
-(void)campaign: (id)sender;

@end
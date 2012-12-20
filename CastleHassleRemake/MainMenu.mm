//
//  MainMenu.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/18.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "MainMenu.h"
#import "SinglePlayer.h"


@implementation MainMenu

@synthesize bg;

static MainMenu* instance = nil;

+(MainMenu*) instance{
    if (instance == nil) {
        instance = [[MainMenu alloc] init];
    }
    return instance;
}

+(void) resetInstance{
    [instance release];
    instance = nil;
}

-(id)init{
    
    if ((self = [super init])) {
        
        [self addChild:[MainMenuLayer node] z:1 tag:MAIN_MENU_LAYER];
        
        [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"background-music.caf"];
        
        if ([SimpleAudioEngine sharedEngine].willPlayBackgroundMusic) {
            [SimpleAudioEngine sharedEngine].backgroundMusicVolume = 1.0f;
        
        }
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background-music.caf"];
    }
    return self;
}

@end


@implementation MainMenuLayer

-(id)init{
    if ((self=[super init])) {
        
        bg = sprite(@"background.jpg");
        [bg setPosition:ccp(240, 160)];
        [self addChild:bg z:0];
        
        CCSprite* logo = sprite(@"logo.png");
        [logo setPosition:ccp(240,245)];
        [self addChild:logo z:0];
        
        CCSprite* navBack = sprite(@"splashNavBack.png");
        [navBack setPosition:ccp(240,62)];
        [self addChild:navBack z:0];
        
        
        [CCMenuItemFont setFontSize:16];
        [CCMenuItemFont setFontName:@"arial"];
        
        
        [self makeButtonWithString:@"Single Player" atPosition:ccp(-70,-75) withSelector:@selector(singlePlayer:)];
        
        [self makeButtonWithString:@"Settings" atPosition:ccp(70,-121) withSelector:@selector(settings:)];
        
        [self makeButtonWithString:@"Campaign" atPosition:ccp(-70,-121) withSelector:@selector(campaign:)];
        
        [self makeButtonWithString:@"How-to-play" atPosition:ccp(70,-75) withSelector:@selector(howToPlay:)];

        
    }
    return self;
    
}

-(void)campaign:(id)sender
{
    
}

-(void)singlePlayer:(id)sender
{
    MainMenu* main = [MainMenu instance];
    [main removeChild:self cleanup:YES];
    [main addChild:[SinglePlayer node]];
    
}

-(void)settings:(id)sender
{
    
}

-(void)howToPlay:(id)sender
{
    
}

@end
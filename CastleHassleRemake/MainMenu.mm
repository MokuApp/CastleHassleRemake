//
//  MainMenu.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/18.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "MainMenu.h"


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
        
    }
    return self;
    
}

@end
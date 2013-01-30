//
//  HUDActionController.m
//  CastleHassleRemake
//
//  Created by tedant on 13/01/30.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import "HUDActionController.h"
#import "HUD.h"

@implementation HUDActionController

@synthesize hud;

static HUDActionController* instance = nil;

+(HUDActionController*)instance{
    if (instance == nil) {
        instance = [HUDActionController alloc];
        [instance init];
    }
    
    return instance;
}

-(id)init{
    
    if ((self = [super init])) {
        
    }
    return self;
}

-(void)showMainMenu{
    if (hud != nil) {
        [hud showMainMenu];
    }
}

-(void)showBuildMenu{
    if (hud != nil) {
        [hud showBuildMenu];
    }
}

-(void)showSettings{
    [hud showSettings];
}


@end

//
//  SinglePlayer.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/19.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseMenu.h"

@class CHToggle;

@interface SinglePlayer : BaseMenu {
    NSMutableArray* toggles;
    
    CHToggle* difficulties;
    CHToggle* opponents;
    CHToggle* environment;
}

+(SinglePlayer*) instance;


@end

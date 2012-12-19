//
//  BaseMenu.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/19.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BaseMenu : CCLayer {
    
}

-(CCMenuItemSprite*)makeButtonWithString:(NSString*)s atPosition:(CGPoint)p withSelector:(SEL)selector;

@end

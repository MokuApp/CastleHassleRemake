//
//  CHToggleItem.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/20.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CHToggle;

@interface CHToggleItem : CCLayer {
    CHToggle* parent;
    CGRect selectedRect;
    CGRect unselectedRect;
    CCSprite* img;
    CCMenuItemFont* item;
    int yOffset;
}

@property(nonatomic)int yOffset;
@property(nonatomic, retain)CCSprite* img;
@property(nonatomic, retain)CCMenuItemFont* item;

-(id)initWithParent:(CHToggle*)p selectedRect:(CGRect)sel deselectedRect:(CGRect)desel buttonText:(NSString*)str;

-(void) responder:(id)sender;

@end

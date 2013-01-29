//
//  ButtonItem.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/28.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "HUDItem.h"

@interface ButtonItem : HUDItem {
    SEL func;
    CCLabelTTF *buttonText;
}

@property(nonatomic) SEL func;
@property(nonatomic, retain) CCLabelTTF *buttonText;

-(void) postInitWithText:(NSString*) text;

@end

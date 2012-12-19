//
//  BaseMenu.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/19.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "BaseMenu.h"


@implementation BaseMenu

-(id)init{
    if ((self = [super init])) {
        
    }
    return self;
}

-(CCMenuItemSprite*)makeButtonWithString:(NSString *)s atPosition:(CGPoint)p withSelector:(SEL)selector{
    
    [CCMenuItemFont setFontSize:16];
    
    CGRect buttonFrame = CGRectMake(0, 38, 124, 38);
    
    CCSprite* button = spriteWithRect(@"stdButtons.png",buttonFrame);
    CCSprite* selectedButton = spriteWithRect(@"stdButtonsPressed.png", buttonFrame);
    
    CCMenuItemSprite* menuItem = [CCMenuItemSprite itemFromNormalSprite:button 
                                                         selectedSprite:selectedButton 
                                                                 target:self 
                                                               selector:selector];
    menuItem.position = p;
    
    CCLabelTTF* label = [CCLabelTTF labelWithString:s fontName:@"arial" fontSize:15.f];
    label.position = ccp(buttonFrame.size.width/2.f, buttonFrame.size.height / 2.f);
    
    [menuItem addChild:label];
    
    CCMenu* menu = [CCMenu menuWithItems:menuItem, nil];
    [self addChild:menu z:6];
    
    return menuItem;
    
}

@end

//
//  ButtonItem.m
//  CastleHassleRemake
//
//  Created by tedant on 13/01/28.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import "ButtonItem.h"
#import "Battlefield.h"
#import "HUDActionController.h"


@implementation ButtonItem

@synthesize func, buttonText;

-(void)postInitWithText:(NSString *)text{
    
    self.buttonText = [CCLabelTTF labelWithString:text fontName:@"Arial" fontSize:20.0];
    [buttonText setPosition:CGPointMake(img.position.x, img.position.y)];
    [[Battlefield instance] addChild:buttonText z:HUD_Z_INDEX+1];
     
    
}

-(void)hideWithAnimations:(BOOL)animation{
    [super hideWithAnimations:animation];
    
    if (animation) {
        [buttonText runAction:[CCFadeOut actionWithDuration:.25]];
    }else{
        buttonText.visible = NO;
    }
}

-(void)show{
    [super show];
    
    [buttonText runAction:[CCFadeIn actionWithDuration:.25]];
    
    buttonText.position = img.position;
}

-(void)move:(CGPoint)p{
    [super move:p];
    buttonText.position = CGPointMake(buttonText.position.x - p.x, buttonText.position.y);
}

-(BOOL) handleInitialTouch:(CGPoint)p{
    [[HUDActionController instance] performSelector:func];
    return YES;
}

@end

//
//  HUD.mm
//  CastleHassleRemake
//
//  Created by tedant on 13/01/27.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import "HUD.h"
#import "Battlefield.h"
#import "HUDMenu.h"
#import "HUDItem.h"
#import "ButtonItem.h"
#import "HUDActionController.h"


@implementation HUD

@synthesize tabUpSprite,tabDownSprite,tabSprite,mainMenu,inFocus,buildMenu;

-(id)init{
    
    if ((self = [super init])) {
        
        [[HUDActionController instance] setHud:self];
        
        self.tabUpSprite = spriteWithRect(@"hud.png", CGRectMake(184, 58, 112, 22));
        tabUpSprite.position = CGPointMake(480.0/2.0, 320.0-HUD_HEIGHT-(22.0/2.0));
        
        self.tabDownSprite = spriteWithRect(@"hud.png", CGRectMake(184, 81, 112, 22));
        tabDownSprite.position = CGPointMake(480.0/2.0, 320.0-(22.0/2.0));
        [tabDownSprite setVisible:NO];
        
        self.tabSprite = spriteWithRect(@"hud.png", CGRectMake(0, 0, 480, HUD_HEIGHT));
        tabSprite.position = CGPointMake(480.0/2.0, 320.0-(HUD_HEIGHT/2.0));
        [tabSprite setVisible:YES];
        [tabSprite setOpacity:200.0f];
        
        
        [[Battlefield instance] addChild:tabUpSprite z:HUD_Z_INDEX];
        [[Battlefield instance] addChild:tabDownSprite z:HUD_Z_INDEX];
        [[Battlefield instance] addChild:tabSprite z:HUD_Z_INDEX];
        
        [self initBuildMenu];
        [self initMainMenu];
        [self showMainMenu];

        
    }
    return self;
}


-(void)moveAllObjects:(CGPoint)p{
    
    tabUpSprite.position = CGPointMake(tabUpSprite.position.x - p.x, tabUpSprite.position.y);
    tabDownSprite.position = CGPointMake(tabDownSprite.position.x - p.x, tabDownSprite.position.y);
    tabSprite.position = CGPointMake(tabSprite.position.x - p.x, tabSprite.position.y);
    
    if (inFocus != nil) {
        [inFocus moveAllObjects:p];
    }
    
}


-(void) expandMenu {
    
    menuIsHidden = NO;
    [tabDownSprite setVisible:NO];
    [tabUpSprite setVisible:YES];
    [tabSprite setVisible:YES];
    [self showMainMenu];
}

-(void) collapseMenu{
    
    menuIsHidden = YES;
    [tabDownSprite setVisible:YES];
    [tabUpSprite setVisible:NO];
    [tabSprite setVisible:NO];
    [self hideMenu];
}

-(BOOL) handleInitialTouch:(CGPoint)p{
    
    
    if (CGRectContainsPoint([self tabRect], p)) {
        if (menuIsHidden) {
            [self expandMenu];
        }else{
            [self collapseMenu];
        }
        
        return YES;
    }
    
    if (inFocus != nil) {
        return [inFocus handleInitialTouch:p];
    }
    
    return NO;
}

-(void)initMainMenu{
    
    self.mainMenu = [[[HUDMenu alloc] init] autorelease];
    
    [mainMenu addButtonItemWithImageName:@"stdButtons.png" 
                                imageBox:CGRectMake(0, 77, 104, 36) 
                           swingImageBox:CGRectMake(0, 0, 0, 0) 
                                selector:@selector(showBuildMenu) 
                                   title:@"Build"];
    
    
    ButtonItem* settingButton = [mainMenu addButtonItemWithImageName:@"stdButtons.png" 
                                                            imageBox:CGRectMake(0, 77, 104, 37) 
                                                       swingImageBox:CGRectMake(0, 0, 0, 0) 
                                                            selector:@selector(showSetting) 
                                                               title:@"Menu"];
    
    settingButton.leftBound = 480 - ICON_SPACING - settingButton.img.textureRect.size.width;
    settingButton.rightBound = 480 - ICON_SPACING;
    
    [mainMenu hideAll];
}

-(void)initBuildMenu{
    
    self.buildMenu = [[[HUDMenu alloc] init] autorelease];
    
    ButtonItem* leftBtn = [buildMenu addButtonItemWithImageName:@"stdButtons.png"  
                                                       imageBox:CGRectMake(105, 78, 38, 37) 
                                                  swingImageBox:CGRectMake(0, 0, 0, 0) 
                                                       selector:@selector(showMainMenu) 
                                                          title:@""];
    [leftBtn.img setOpacity:100.0f];
    
    
    [buildMenu hideAll];
}

-(void)showMenu:(HUDMenu *)menu{
    [self hideMenu];
    [menu showAll];
    inFocus = menu;
}

-(void)showMainMenu{
    [self showMenu:mainMenu];
}

-(void)showBuildMenu{
    [self showMenu:buildMenu];
}

-(void)showSettings{
    
}

-(void)hideMenu{
    [inFocus hideAll];
    inFocus = nil;
}

-(CGRect) tabRect{
    
    if (menuIsHidden) 
        return CGRectMake((480-tabUpSprite.textureRect.size.width)/2.0, 
                          320-tabUpSprite.textureRect.size.height, 
                          tabUpSprite.textureRect.size.width, 
                          tabUpSprite.textureRect.size.height);
    else
        return CGRectMake((480-tabUpSprite.textureRect.size.width)/2.0, 
                          320-HUD_HEIGHT-tabUpSprite.textureRect.size.height, 
                          tabUpSprite.textureRect.size.width, 
                          tabUpSprite.textureRect.size.height);
}

@end

//
//  SinglePlayer.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/19.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "SinglePlayer.h"
#import "CHToggle.h"
#import "CHToggleItem.h"


@implementation SinglePlayer

static SinglePlayer* instance = nil;

+(SinglePlayer*)instance{
    
    if (instance == nil) {
        instance = [SinglePlayer alloc];
        [SinglePlayer init];
    }
    return instance;
}

-(id)init{
    
    if ((self = [super init])) {
        
        CCSprite* bg = sprite(@"background.jpg");
        [bg setPosition:ccp(240,160)];
        [self addChild:bg z:0];
        
        CCSprite* navBack = sprite(@"menuBack.png");
        [navBack setPosition:ccp(240,160)];
        [self addChild:navBack z:0];
        
        CCLabelTTF* title = [CCLabelTTF labelWithString:@"Single Player Game" fontName:@"Arial-BoldMT" fontSize:24];
        [title setColor:ccc3(15, 147, 222)];
        title.position = ccp(240,280);
        [self addChild:title z:1];
        
        difficulties = [[CHToggle alloc] initWithImageName:@"comboButtons.png"];
        
        CHToggleItem* easy = [[CHToggleItem alloc] initWithParent:difficulties 
                                                     selectedRect:CGRectMake(0, 121, 94, 36) 
                                                   deselectedRect:CGRectMake(0, 157, 94, 36) 
                                                       buttonText:@"       Easy"];
        [difficulties addItem:easy];
        [easy setYOffset:5];
        [easy release];
        
        CHToggleItem* medium = [[CHToggleItem alloc] initWithParent:difficulties 
                                                     selectedRect:CGRectMake(94, 121, 94, 36) 
                                                     deselectedRect:CGRectMake(94, 157, 94, 36) 
                                                         buttonText:@"     Medium"];
        [difficulties addItem:medium];
        [medium setYOffset:5];
        [medium release];

        CHToggleItem* hard = [[CHToggleItem alloc] initWithParent:difficulties 
                                                       selectedRect:CGRectMake(186, 121, 94, 36) 
                                                     deselectedRect:CGRectMake(186, 157, 94, 36) 
                                                         buttonText:@"       Hard"];
        [difficulties addItem:hard];
        [hard setYOffset:5];
        [hard release];

        
        [difficulties setPosition:ccp(-15,75)];
        [self addChild:difficulties z:3];
        [toggles addObject:difficulties];
        [difficulties release];
        
        
        opponents = [[CHToggle alloc] initWithImageName:@"comboButtons.png"];
        
        CHToggleItem* one = [[CHToggleItem alloc] initWithParent:opponents 
                                                    selectedRect:CGRectMake(0, 121, 94, 36) 
                                                  deselectedRect:CGRectMake(0, 157, 94, 36) 
                                                      buttonText:@"          1"];
        [opponents addItem:one];
        [one setYOffset:5];
        [one release];
        
        CHToggleItem* two = [[CHToggleItem alloc] initWithParent:opponents 
                                                    selectedRect:CGRectMake(94, 121, 94, 36) 
                                                  deselectedRect:CGRectMake(94, 157, 94, 36) 
                                                      buttonText:@"          2"];
        [opponents addItem:two];
        [two setYOffset:5];
        [two release];

        CHToggleItem* three = [[CHToggleItem alloc] initWithParent:opponents 
                                                    selectedRect:CGRectMake(186, 121, 94, 36) 
                                                  deselectedRect:CGRectMake(186, 157, 94, 36) 
                                                      buttonText:@"          3"];
        [opponents addItem:three];
        [three setYOffset:5];
        [three release];
        
        [opponents setPosition:ccp(-15,13)];
        [self addChild:opponents z:3];
        [toggles addObject:opponents];
        [opponents release];
        
        environment = [[CHToggle alloc] initWithImageName:@"comboButtons.png"];
        
        CHToggleItem *tuscany = [[CHToggleItem alloc] initWithParent:environment 
                                                        selectedRect:CGRectMake(0, 0, 94, 60) 
                                                      deselectedRect:CGRectMake(0, 61, 94, 60) 
                                                          buttonText:@"     Tuscany"];
        [environment addItem:tuscany];
        [tuscany release];
        
        CHToggleItem *saxony = [[CHToggleItem alloc] initWithParent:environment 
                                                        selectedRect:CGRectMake(94, 0, 94, 60) 
                                                      deselectedRect:CGRectMake(94, 61, 94, 60) 
                                                          buttonText:@"     Saxony"];
        [environment addItem:saxony];
        [saxony release];
        
        CHToggleItem *brittany = [[CHToggleItem alloc] initWithParent:environment 
                                                        selectedRect:CGRectMake(188, 0, 94, 60) 
                                                      deselectedRect:CGRectMake(188, 61, 94, 60) 
                                                          buttonText:@"     Brittany"];
        [environment addItem:brittany];
        [brittany release];
        
        [environment setPosition:ccp(-15,-55)];
        [self addChild:environment z:3];
        
    }
    if (!instance) {
        instance = self;
    }
    
    return self;
}


@end

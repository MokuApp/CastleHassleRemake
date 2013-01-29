//
//  HUDMenu.mm
//  CastleHassleRemake
//
//  Created by tedant on 13/01/28.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import "HUDMenu.h"
#import "ButtonItem.h"
#import "Battlefield.h"

@implementation HUDMenu

@synthesize items;

-(id)init{
    
    if ((self = [super init])) {
        extremeRight = ICON_SPACING;
        
        self.items = [NSMutableArray array];
    }
    return self;
}

-(ButtonItem*) addButtonItemWithImageName:(NSString *)imageName imageBox:(CGRect)box 
                            swingImageBox:(CGRect)swingBox selector:(SEL)s title:(NSString *)t{
    
    ButtonItem *item = [[[ButtonItem alloc] init] autorelease];
    
    [self addItemWithImageName:imageName imageBox:box swingImageBox:swingBox hudItem:item expandToStatusSize:NO];
    
    [item postInitWithText:t];
    item.func = s;
    
    [items addObject:item];
    
    return item;
    
}

-(void) addItemWithImageName:(NSString *)imageName imageBox:(CGRect)box 
               swingImageBox:(CGRect)swingBox hudItem:(HUDItem *)item expandToStatusSize:(BOOL)expand{
    
    item.leftBound = extremeRight;
    extremeRight += expand ? HUD_STATUS_ITEM_SIZE + ICON_SPACING : box.size.width + ICON_SPACING;
    item.rightBound = extremeRight;
    
    item.img = spriteWithRect(imageName, box);
    
    item.img.position = ccp(item.leftBound+(item.rightBound-item.leftBound)/2, 320-(HUD_HEIGHT/2));
    
    item.imageName = imageName;
    
    [[Battlefield instance] addChild:item.img z:HUD_Z_INDEX];
}

-(void)moveAllObjects:(CGPoint)p{
    for (HUDItem* item in items) {
        [item move:p];
    }
}

-(void)hideAll{ 
    
    for (HUDItem* item in items) {
        [item hideWithAnimations:YES];
    }
}

-(void)showAll{
    
    for (HUDItem* item in items) {
        [item show];
    }
}


@end

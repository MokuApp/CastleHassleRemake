//
//  CHToggle.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/20.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CHToggleItem;

@interface CHToggle : CCLayer {
    
    NSMutableArray* items;
    CGPoint position;
    int selectedIndex;
}

@property(nonatomic, assign) CGPoint position;
@property(nonatomic, assign) int selectedIndex;
@property(nonatomic, retain) NSString* image;


-(id)initWithImageName:(NSString*)s;
-(void)addItem:(CHToggleItem*)item;
-(void)selectItemAtIndex:(int)index;
-(void)toggled:(id)sender;
-(void)clearSelection;

@end

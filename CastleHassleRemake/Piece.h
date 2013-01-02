//
//  Piece.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class PlayerArea;

@interface Piece : NSObject{
    
}

-(id) initWithWorld:(CGPoint)p;
-(void) setupSpriteWithRect:(CGRect)rect image:(NSString*)image atPoint:(CGPoint)p;

@property(nonatomic, assign) PlayerArea *owner;

@property(nonatomic, retain) CCSprite* currentSprite;
@property(nonatomic, retain) CCSprite* backSprite;


@end

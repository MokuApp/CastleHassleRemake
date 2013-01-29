//
//  Battlefield.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/21.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "SimpleAudioEngine.h"

@class PlayerAreaManager,PlayerArea,Piece,Weapon,Projectile,HUD;

@interface Battlefield : CCLayer {
    
    CGPoint initialTouch;
    float screenMomentum;
    
    float gameTime;
}


@property(nonatomic) b2World* world;
@property(nonatomic, retain) NSMutableArray *tileables;
@property(nonatomic, retain) PlayerAreaManager *playerAreaManager;
@property(nonatomic, retain) NSMutableArray *bin;
@property(nonatomic, retain) HUD* hud;


+(Battlefield*)instance;


-(void)tileImagePool:(CGPoint)loc delta:(CGPoint)d;
-(void)moveScreen;


-(void) loadForPlayer:(PlayerArea*)player file:(NSString*)filename;
-(CGPoint) transformTouchesToPoint:(NSSet*)touches withCameraOffset:(BOOL)cam;
-(void) addProjectileToBin:(Projectile*)p;

-(void) addNewPieceWithCoords:(CGPoint)p andClass:(Class)c withImageNam:(NSString*)manageNam finalize:(BOOL)finalize player:(PlayerArea*)player;

@end

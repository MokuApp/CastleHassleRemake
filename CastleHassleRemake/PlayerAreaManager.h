//
//  PlayerAreaManager.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/27.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerArea.h"
#import "SimpleAudioEngine.h"

@interface PlayerAreaManager : NSObject{
    NSMutableArray *playerAreas;    
}

@property(nonatomic, retain) NSMutableArray *playerAreas;

-(id)initWithPlayerAreaWorld;
-(void)loadPlayer;


@end

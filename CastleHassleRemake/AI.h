//
//  AI.h
//  CastleHassleRemake
//
//  Created by tedant on 13/01/04.
//  Copyright (c) 2013 MokuApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlayerArea,Weapon;


@interface AI : NSObject{
    
    PlayerArea* playerArea;
}


+(id)aiWithPlayer:(PlayerArea*)p;
-(id)initWithPlayer:(PlayerArea*)p;

-(void)readyToFire:(Weapon*)w;


@end

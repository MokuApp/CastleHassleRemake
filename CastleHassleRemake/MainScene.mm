//
//  MainScene.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/21.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "MainScene.h"
#import "Battlefield.h"


@implementation MainScene

+(id)scene{
    CCScene *scene = [CCScene node];
    [scene addChild:[MainScene node]];
    
    return scene;
}

-(id)init{
    
    if ((self = [super init])) {
        
        Battlefield *bf = [Battlefield instance];
        
        [self addChild:bf];
        
    }
    return self;
}

@end

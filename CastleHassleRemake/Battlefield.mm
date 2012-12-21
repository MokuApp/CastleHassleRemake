//
//  Battlefield.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/21.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "Battlefield.h"


@implementation Battlefield

static Battlefield* instance = nil;

+(Battlefield*)instance{
    
    if (instance == nil) {
        instance = [Battlefield alloc];
        [instance init];
    }
    return instance;
}


-(id)init{
    if ((self = [super init])) {
        
        
        instance = self;
        
        
    }
    return self;
}

@end

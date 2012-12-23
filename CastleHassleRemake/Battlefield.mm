//
//  Battlefield.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/21.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "Battlefield.h"
#import "Background.h"


@implementation Battlefield

@synthesize tileables;

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
        
        SimpleAudioEngine *backgroundSound = [SimpleAudioEngine sharedEngine];
        if (backgroundSound != nil) {
            [backgroundSound preloadBackgroundMusic:@"backGroundMusic.caf"];
            if (backgroundSound.willPlayBackgroundMusic) {
                backgroundSound.backgroundMusicVolume = 0.3f;
            }
        }
        
        [backgroundSound playBackgroundMusic:@"backGroundMusic.caf"];
        
        self.tileables = [NSMutableArray array];
        
        self.isTouchEnabled = YES;
        
        
        
        Background *foreground = [[[Background alloc] initWithLeftImage:@"bfrontLeft.png" 
                                                            rightImage:@"bfrontRight.png" 
                                                        imageDimension:CGPointMake(607.0, 320.0)
                                                                 layer:self 
                                                                 index: FOREGROUND_Z_INDEX
                                                         parallaxFactor:-1.0] autorelease];
        
        Background *midground = [[[Background alloc] initWithLeftImage:@"bmiddleLeft.png" 
                                                             rightImage:@"bmiddleRight.png" 
                                                         imageDimension:CGPointMake(607.0, 320.0)
                                                                  layer:self 
                                                                  index: MIDGROUND_Z_INDEX
                                                         parallaxFactor:1.5] autorelease];
        
        Background *background = [[[Background alloc] initWithLeftImage:@"bbackLeft.jpg" 
                                                             rightImage:@"bbackRight.jpg" 
                                                         imageDimension:CGPointMake(607.0, 320.0)
                                                                  layer:self 
                                                                  index: BACKGROUND_Z_INDEX
                                                         parallaxFactor:10.0] autorelease];
        
        [tileables addObject:foreground];
        [tileables addObject:midground];
        [tileables addObject:background];
        
    }
    return self;
}


@end

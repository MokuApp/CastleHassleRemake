//
//  Battlefield.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/21.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "Battlefield.h"
#import "Background.h"


#import "AppDelegate.h"

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
        
        AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [delegate.window setMultipleTouchEnabled:NO];
        
        
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
        
        screenMomentum = 0.0;
        [self moveScreen];
        
    }
    return self;
}



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    initialTouch = [self transformTouchesToPoint:touches withCameraOffset:NO];
    screenMomentum = 0.0;
    
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint location;
    
    
    location = [self transformTouchesToPoint:touches withCameraOffset:NO];
    CCLOG(@"location x is %f", location.x);
    CGPoint movement = CGPointMake(location.x - initialTouch.x, location.y - initialTouch.y);
    CCLOG(@"movement x is %f",movement.x);
    initialTouch = location;
    CCLOG(@"initialTouch x is %f",initialTouch.x );
    
    screenMomentum = movement.x;
    [self moveScreen];
    
    
}

-(void)tileImagePool:(CGPoint)loc delta:(CGPoint)d{
    
    for (Background* b in tileables) {
        [b positionForCameraLoc:loc];
        
        float factor = (b.parallaxFactor != 0.0 ? d.x/b.parallaxFactor + d.x : d.x);
        
        CCLOG(@"factor is %f",factor);
        CCLOG(@"imageA is %@ and pos x is %f",b.imageA, b.imageA.position.x);
        [b.imageA setPosition:CGPointMake(b.imageA.position.x - factor, b.imageA.position.y)];
        CCLOG(@"after imageA is %@ and pos x is %f",b.imageA, b.imageA.position.x);
        [b.imageB setPosition:CGPointMake(b.imageB.position.x - factor, b.imageB.position.y)];
        
    }
}


-(void)moveScreen{
    
    CGPoint delta = CGPointMake(screenMomentum, 0.0f);
    
    float x,y,z;
    [self.camera centerX:&x centerY:&y centerZ:&z];
    
    CCLOG(@"delta x is %f y is %f",delta.x,delta.y);
    CCLOG(@"camera x is %f y is %f",x,y);
    [self tileImagePool:CGPointMake(x, y) delta:delta];
    
    CCLOG(@"deleta x moveing %f",x-(delta.x));
    [self.camera setCenterX:x-(delta.x) centerY:y centerZ:0.0];
    [self.camera setEyeX:x-(delta.x) eyeY:y eyeZ:[CCCamera getZEye]];
    
    screenMomentum += screenMomentum > 0.0 ? 0.2 * -1 : 0.2;
    
}

-(CGPoint) transformTouchesToPoint:(NSSet *)touches withCameraOffset:(BOOL)cam{
    
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    
    CGPoint location = [touch locationInView:[touch view]];
    
    location = [[CCDirector sharedDirector] convertToGL: location];
    
    if (cam) {
        float x,y,z;
        [self.camera centerX:&x centerY:&y centerZ:&z];
        location.x += x;
        location.y += y;
    }
    return location;
}


@end

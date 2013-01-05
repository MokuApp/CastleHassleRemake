//
//  Battlefield.mm
//  CastleHassleRemake
//
//  Created by tedant on 12/12/21.
//  Copyright 2012 MokuApp. All rights reserved.
//

#import "Battlefield.h"
#import "Background.h"
#import "PlayerAreaManager.h"
#import "PlayerArea.h"
#import "Piece.h"
#import "Weapon.h"
#import "Tower.h"
#import "Cannon.h"
#import "City.h"
#import "Projectile.h"

#import "AppDelegate.h"
#import "JSONKit.h"


@implementation Battlefield

@synthesize tileables,playerAreaManager,world,bin;

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
        self.bin = [NSMutableArray array];
        gameTime = 0.0;
        
        self.isTouchEnabled = YES;
        
        //setting gravity
        b2Vec2 gravity;
        gravity.Set(0.0f, -9.0f);
        
        bool doSleep = true;
        
        world = new b2World(gravity, doSleep);
        
        
        
        
        
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
        
        self.playerAreaManager = [[[PlayerAreaManager alloc] initWithPlayerAreaWorld] autorelease];
        [playerAreaManager loadPlayer];
        
        [self schedule: @selector(tick:)];
        
        screenMomentum = 0.0;
        [self moveScreen];
        
    }
    return self;
}


-(void) tick: (ccTime) dt {
    
    
    int32 velocityIterations = 8;
    int32 positionIterations = 3;
    
    world->Step(dt, velocityIterations, positionIterations);
    
    gameTime += dt;
    
    
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext()) {
        
        if (b->GetUserData() != NULL && ![(NSObject*)b->GetUserData() isKindOfClass:[PlayerArea class]]) {

            Piece* piece = (Piece*)b->GetUserData();
            b2Vec2 pos = b->GetPosition();
            float ang = b->GetAngle();
            
            piece.currentSprite.position = ccp(pos.x*PTM_RATIO, pos.y*PTM_RATIO);
            piece.currentSprite.rotation = -1 * CC_RADIANS_TO_DEGREES(ang);
            
            if ([piece isKindOfClass:[Weapon class]]) {
                [(Weapon*)piece updateSpritesAngle:ang position:pos time:dt];
            }
            if ([piece isKindOfClass:[City class]]) {

            }
            if ([piece isKindOfClass:[Projectile class]]) {
                [(Projectile*)piece updateSpritePosition:pos body:b];
            }

        }
    }
     
}



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    initialTouch = [self transformTouchesToPoint:touches withCameraOffset:NO];
    screenMomentum = 0.0;
    
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint location;
    
    location = [self transformTouchesToPoint:touches withCameraOffset:NO];
    CGPoint movement = CGPointMake(location.x - initialTouch.x, location.y - initialTouch.y);
    
    initialTouch = location;
    screenMomentum = movement.x;
    [self moveScreen];
    
}

-(void)tileImagePool:(CGPoint)loc delta:(CGPoint)d{
    
    for (Background* b in tileables) {
        [b positionForCameraLoc:loc];
        
        float factor = (b.parallaxFactor != 0.0 ? d.x/b.parallaxFactor + d.x : d.x);
        
        [b.imageA setPosition:CGPointMake(b.imageA.position.x - factor, b.imageA.position.y)];
        [b.imageB setPosition:CGPointMake(b.imageB.position.x - factor, b.imageB.position.y)];
        
    }
}


-(void)moveScreen{
    
    CGPoint delta = CGPointMake(screenMomentum, 0.0f);
    
    float x,y,z;
    [self.camera centerX:&x centerY:&y centerZ:&z];
    
    [self tileImagePool:CGPointMake(x, y) delta:delta];
    
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

-(void)loadForPlayer:(PlayerArea *)player file:(NSString *)filename{
    
    filename = [[NSBundle mainBundle] pathForResource:filename ofType:@"dat"];
    
    CCLOG(@"attempting to open %@",filename);
    
    NSDictionary* state = [[NSString stringWithContentsOfFile:filename encoding:NSASCIIStringEncoding error:nil] objectFromJSONString];
    
    for (NSDictionary* data in state) {
        
        CCLOG(@"data is %@",data);
        NSMethodSignature *sig;
        SEL func = @selector(addNewPieceWithCoords:andClass:withImageNam:finalize:player:);
        
        Class c = NSClassFromString([data objectForKey:@"class"]);
        NSString* s = [NSString stringWithFormat:@"%@.png", [[data objectForKey:@"class"] lowercaseString]];
        float x = [[data objectForKey:@"x"] floatValue] * PTM_RATIO;
        CGPoint p = CGPointMake([[data objectForKey:@"y"] floatValue] *PTM_RATIO+1, x);
//        BOOL left = [[data objectForKey:@"left"] intValue] == 0;
        BOOL f = YES;
        
        sig = [Battlefield instanceMethodSignatureForSelector:func];
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setSelector:func];
        [invocation setTarget:self];
        [invocation setArgument:&p atIndex:2];
        [invocation setArgument:&c atIndex:3];
        [invocation setArgument:&s atIndex:4];
        [invocation setArgument:&f atIndex:5];
        [invocation setArgument:&player atIndex:6];
        [invocation invoke];
        
    }
    
}

-(void) addNewPieceWithCoords:(CGPoint)p andClass:(Class)c withImageNam:(NSString *)manageNam finalize:(BOOL)finalize player:(PlayerArea *)player{
    
    CCLOG(@"class is %@",c);
    Piece *piece = [[[c alloc] initWithWorld:world coords:p] autorelease];
    
    piece.owner = player;
    
    if (finalize) {
        [piece finalizePiece];
    }
    
    [self.bin addObject:piece];
}


-(void) addProjectileToBin:(Projectile *)p{
    [self.bin addObject:p];
}

@end

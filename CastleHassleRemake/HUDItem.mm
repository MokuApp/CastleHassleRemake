//
//  HUDItem.mm
//  CastleHassleRemake
//
//  Created by tedant on 13/01/28.
//  Copyright 2013 MokuApp. All rights reserved.
//

#import "HUDItem.h"
#import "Battlefield.h"

@implementation HUDItem

@synthesize img,leftBound,rightBound,imageName;

-(id)init{
    
    if ((self = [super init])) {
        
    }
    return self;
}

-(void)hideWithAnimations:(BOOL)animation{
    
    if (animation) {
        [img runAction:[CCFadeOut actionWithDuration:.25]];
    }else{
        img.visible = NO;
    }
    
}

-(void)show{
    
    [img runAction:[CCFadeIn actionWithDuration:.25]];
    float camX,camY,camZ;
    [[Battlefield instance].camera centerX:&camX centerY:&camY centerZ:&camZ];
    img.position = ccp(leftBound+(rightBound-leftBound)/2+camX, img.position.y);
}

-(void)move:(CGPoint)p{
    img.position = CGPointMake(img.position.x - p.x, img.position.y);
}

@end

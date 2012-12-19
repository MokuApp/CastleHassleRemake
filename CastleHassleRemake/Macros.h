//
//  Macros.h
//  CastleHassleRemake
//
//  Created by tedant on 12/12/19.
//  Copyright (c) 2012 MokuApp. All rights reserved.
//




#define spriteWithRect(__name__, __rect__) [CCSprite spriteWithSpriteFrame:[CCSpriteFrame frameWithTexture:[[CCTextureCache sharedTextureCache] addImage:__name__] rect:__rect__]]
#define sprite(__name__) [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] addImage:__name__]]
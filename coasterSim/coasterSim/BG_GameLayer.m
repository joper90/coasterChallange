//
//  BG_GameLayer.m
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "BG_GameLayer.h"

/*
 * This is the
 */

@implementation BG_GameLayer
-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"BG_GameLayer : init()");
        //No handling enabled for this layer
        self.touchEnabled = NO;

        //Lets add a bg image.
        //Set the best mode?
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *background = [CCSprite spriteWithFile:@"coasterBG.png"];
        background.anchorPoint = ccp(0,0);
        [self addChild:background];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
        
	}
	return self;
}

@end

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

	}
	return self;
}

@end

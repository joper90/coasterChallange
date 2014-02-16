//
//  FG_GameLayer.m
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "FG_GameLayer.h"


@implementation FG_GameLayer

-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"FG_GameLayer : init()");
        //No handling enabled for this layer
        self.touchEnabled = NO;
        
	}
	return self;
}


@end

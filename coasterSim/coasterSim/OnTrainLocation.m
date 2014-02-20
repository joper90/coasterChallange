//
//  OnTrainLocation.m
//  coasterSim
//
//  Created by Joe on 19/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "OnTrainLocation.h"
#import "cocos2d.h"

@implementation OnTrainLocation

@synthesize trainSeatLocation, taken, location, movementSequence;

-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"OnTrainLocation : init()");
        taken = NO;
	}
	return self;
}

@end

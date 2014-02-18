//
//  BoardingLocation.m
//  coasterSim
//
//  Created by Joe Humphries on 18/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "BoardingLocation.h"
#import "cocos2d.h"

@implementation BoardingLocation
@synthesize boardingLocation, taken, location;

-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"BoardingLocation : init()");
        taken = NO;
	}
	return self;
}

@end

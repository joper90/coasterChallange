//
//  Rider.m
//  coasterSim
//
//  Created by Joe on 25/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "Rider.h"

@implementation Rider
@synthesize seatLocked, boarded, riderSprite, initialLocation,tag;

-(id) initWithTag:(NSString *)riderTag andWithSprite:(CCSprite *)sprite andInitalocation:(CGPoint)location
{
	if( (self=[super init]) ) {
		
        CCLOG(@"Rider : initWithTag()");
        tag = riderTag;
        boarded = NO;
        seatLocked = NO;
        riderSprite = sprite;
        initialLocation = location;
        
	}
	return self;
}

-(void)resetRiderLocation
{
    CCLOG(@"Resting %@ position to %.f / %.f", tag, initialLocation.x, initialLocation.y);
    riderSprite.position = initialLocation;
}

@end

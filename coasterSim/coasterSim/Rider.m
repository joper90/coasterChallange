//
//  Rider.m
//  coasterSim
//
//  Created by Joe on 25/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "Rider.h"
#import "Statics.h"
#import "MovementRequester.h"

@implementation Rider
@synthesize seatLocked, boarded, riderSprite, initialLocation,tag, riderState, queueLocation, seatedLocation;

-(id) initWithTag:(NSString *)riderTag andWithSprite:(CCSprite *)sprite andInitalocation:(CGPoint)location
{
	if( (self=[super init]) ) {
		
        CCLOG(@"Rider : initWithTag()");
        tag = riderTag;
        boarded = NO;
        seatLocked = NO;
        riderSprite = sprite;
        initialLocation = location;
        queueLocation = ccp(0,0);
        seatedLocation = ccp(0,0);
        
        riderState = RIDER_LOST;
        
	}
	return self;
}

-(void)resetRiderLocation
{
    CCLOG(@"Resting %@ position to %.f / %.f", tag, initialLocation.x, initialLocation.y);
    riderSprite.position = initialLocation;
}

-(id)setSeatingLocationAndGetMovement:(id)callbackId
{
    seatedLocation = ccp(queueLocation.x , queueLocation.y + SIT_Y_INC_AMOUNT);
    return [MovementRequester moveRiderOntoTrain:seatedLocation andMyself:callbackId withRiderNumber:tag];
}


@end

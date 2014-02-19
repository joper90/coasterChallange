//
//  MovementRequester.m
//  coasterSim
//
//  Created by Joe on 19/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "MovementRequester.h"


@implementation MovementRequester


+(id)moveToBoardingLocationByPoint:(CGPoint)location
{
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:1 position:location];
    return moveTo;
}

@end

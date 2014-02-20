//
//  Train.m
//  coasterSim
//
//  Created by Joe on 19/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "Train.h"

@implementation Train
@synthesize trainName, moveIntoScreen, moveOffScreen, initalStartLocation;

-(void)resetInitialPosistion
{
    _trainSprite.position = initalStartLocation;
}
@end

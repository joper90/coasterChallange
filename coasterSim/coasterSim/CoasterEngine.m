//
//  CoasterEngine.m
//  coasterSim
//
//  Created by Joe on 16/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "CoasterEngine.h"

@implementation CoasterEngine

static CoasterEngine* coasterEngine = nil;

+(CoasterEngine*) instance
{
    if (coasterEngine == nil)
    {
        CCLOG(@"CoasterEngine : Engine instance started....");
        //Alive for the duration of the game
        coasterEngine = [[CoasterEngine alloc]init];
        CCLOG(@"CoasterEngine : instance complete....");
    }
    return coasterEngine;
}

-(id)init
{
    CCLOG(@"CoasterEngine : Engine init method");
    self = [super self];
    if (self != nil)
    {
        //Setup stuff here
    }
    return self;
}

-(BOOL) isAlive
{
    return YES;
}


@end

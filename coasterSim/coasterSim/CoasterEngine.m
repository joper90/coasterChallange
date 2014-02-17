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
        //Setup the Dictionary
        _ridersMap = [[NSMutableDictionary alloc]init];
        
        //Setup stuff here
    }
    return self;
}

-(BOOL) isAlive
{
    return YES;
}

-(CCSprite *)getSpriteForKey:(id)key
{
    return [_ridersMap objectForKey:key];
}

-(NSInteger)whichRiderIsTouched:(CGPoint)touchLocation
{
    for (id key in [CoasterEngine instance].ridersMap)
    {
        CCSprite *rider = [[CoasterEngine instance]getSpriteForKey:key];
        if (CGRectContainsPoint(rider.boundingBox, touchLocation))
        {
            return rider.tag;
        }
    }
    return nil;
}

-(void)updateRiderPositionByTag:(id)riderTag withPosition:(CGPoint)location
{
    [[_ridersMap objectForKey:riderTag]setPosition:location];
}
    


@end

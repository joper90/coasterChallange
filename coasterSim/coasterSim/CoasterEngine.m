//
//  CoasterEngine.m
//  coasterSim
//
//  Created by Joe on 16/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "CoasterEngine.h"
#import "BoardingLocation.h"

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
        //Setup any vars like the Dictionary
        _ridersMap = [[NSMutableDictionary alloc]init];
        _preBoardingLocations = [[NSMutableArray alloc]init];
       
        [self privateSetupPreBoardingLocations];
        
    }
    return self;
}

-(void) privateSetupPreBoardingLocations
{
    //Setup the preBoardingArray;
    int currentXPos = LOADUP_START_X_POS;
    int currentYPos = LOADUP_START_Y_POS;
    
    //Load up the Ten pre boarding locations
    for (int a =0; a < 10;a++)
    {
        //If at 5 (well 4) then we need to incremen the y position to start the
        // next row.
        if (a == 5)
        {
            currentYPos = currentYPos + INC_START_Y;
            currentXPos = LOADUP_START_X_POS;
        }
        CGPoint preBoardingPosition = ccp(currentXPos, currentYPos);
        
        
        BoardingLocation *b = [[BoardingLocation alloc]init];
        NSString *locationName = [NSString stringWithFormat:@"LOCATION%d",a];
        b.boardingLocation = locationName;
        b.location = preBoardingPosition;
        [_preBoardingLocations addObject: b];
        
        CCLOG(@"---> Setting preboardLocation: %@ : x:%f y:%f : arraySize :%d", locationName, preBoardingPosition.x, preBoardingPosition.y, [_preBoardingLocations count]);
        
        currentXPos = currentXPos + INC_START_X;
    }
    CCLOG(@"CoasterEngine : PreBoardLocations all added total : %d", [_preBoardingLocations count]);
}

-(BOOL) isAlive
{
    return YES;
}

-(CCSprite *)getSpriteForKey:(id)key
{
    return [_ridersMap objectForKey:key];
}

-(id)whichRiderIsTouched:(CGPoint)touchLocation
{
    for (id key in [CoasterEngine instance].ridersMap)
    {
        CCSprite *rider = [[CoasterEngine instance]getSpriteForKey:key];
        if (CGRectContainsPoint(rider.boundingBox, touchLocation))
        {
            return key;
        }
    }
    return nil;
}

-(void)setRiderInitalTouchedPositionByTag:(id)riderTag withPosition:(CGPoint)location
{
    [[_ridersMap objectForKey:riderTag]setPosition:location];
}
    
-(void)updateRiderPostionByTag:(id)riderTag withOldCoords:(CGPoint)oldTouchLocation withCoords:(CGPoint)touchLocation
{
    
    CCSprite *rider = [[CoasterEngine instance]getSpriteForKey:riderTag];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    CGPoint newPos = ccpAdd(rider.position, translation);
    rider.position = newPos;
}

@end

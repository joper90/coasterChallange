//
//  CoasterEngine.h
//  coasterSim
//
//  Created by Joe on 16/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Statics.h"
#import "BoardingLocation.h"
#import "OnTrainLocation.h"
#import "Train.h"


@interface CoasterEngine : NSObject
{
    
}

@property NSMutableDictionary *ridersMap;
@property NSMutableArray *preBoardingLocations;
@property NSMutableArray *trainSittingLocations;
@property NSMutableArray *trains;

//singleton of the engine
+(CoasterEngine*) instance;

-(BOOL)isAlive;
-(CCSprite*) getSpriteForKey:(id)key;
-(id) whichRiderIsTouched:(CGPoint) touchLocation;
-(void) setRiderInitalTouchedPositionByTag:(id) riderTag withPosition:(CGPoint) location;
-(void) updateRiderPostionByTag:(id) riderTag withOldCoords:(CGPoint) oldTouchLocation withCoords:(CGPoint)touchLocation;

-(BoardingLocation*) getBoardingInfoByArrayLocation:(int)arrayLocation;
-(OnTrainLocation*) getOnTrainLocationByArrayLocation:(int)arrayLocation;

-(Train*) getTrainByArrayLocation:(int)arrayLocation;
-(void)trainExitComplete:(id)sender;

-(void) privateSetupPreBoardingLocations;
-(void) privateSetupRiderMap;
-(void) privateSetupSittingLocations;
-(void) privateSetupTrains;

@end

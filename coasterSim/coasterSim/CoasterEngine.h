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
@interface CoasterEngine : NSObject
{
    
}

@property NSMutableDictionary *ridersMap;
@property NSMutableArray *preBoardingLocations;


//singleton of the engine
+(CoasterEngine*) instance;

-(BOOL)isAlive;
-(CCSprite*) getSpriteForKey:(id)key;
-(id) whichRiderIsTouched:(CGPoint) touchLocation;
-(void) setRiderInitalTouchedPositionByTag:(id) riderTag withPosition:(CGPoint) location;
-(void) updateRiderPostionByTag:(id) riderTag withOldCoords:(CGPoint) oldTouchLocation withCoords:(CGPoint)touchLocation;

-(BoardingLocation*) getBoardingInfoByArrayLocation:(int)arrayLocation;


-(void) privateSetupPreBoardingLocations;
-(void) privateSetupRiderMap;

@end

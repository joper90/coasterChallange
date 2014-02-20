//
//  CoasterEngine.m
//  coasterSim
//
//  Created by Joe on 16/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "CoasterEngine.h"
#import "BoardingLocation.h"
#import "MovementRequester.h"
#import "Train.h"

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
        _trains = [[NSMutableArray alloc]init];
       
        [self privateSetupPreBoardingLocations];
        [self privateSetupSittingLocations];
        [self privateSetupRiderMap];
        [self privateSetupTrains];
    }
    return self;
}

-(void) privateSetupSittingLocations
{
    CCLOG(@"CoasterEngine : privateSetupSittingLocations");
    //Setup the sitting down location array.
    int currentXPos = SIT_INC_START_X;
    int currentYPos = SIT_INC_START_Y;
    
    //Load up the sitting boarding locations
    for (int a =0; a < 10;a++)
    {
        //If at 5 (well 4) then we need to incremen the y position to start the
        // next row.
        if (a == 5)
        {
            currentYPos = currentYPos + SIT_INC_START_Y;
            currentXPos = SIT_START_X_POS;
        }
        CGPoint trainSittingPosition = ccp(currentXPos, currentYPos);
        
        
        OnTrainLocation *b = [[OnTrainLocation alloc]init];
        NSString *locationName = [NSString stringWithFormat:@"LOCATION%d",a];
        b.trainSeatLocation = locationName;
        b.location = trainSittingPosition;
        b.movementSequence = [MovementRequester moveDirectToLocationByPoint:trainSittingPosition];
        [_trainSittingLocations addObject: b];
        
        CCLOG(@"---> Setting trainSittingLocation: %@ : x:%f y:%f : arraySize :%d", locationName, trainSittingPosition.x, trainSittingPosition.y, [_trainSittingLocations count]);
        currentXPos = currentXPos + LOADUP_INC_START_X;
    }
    CCLOG(@"CoasterEngine : trainSittingLocation all added total : %d", [_trainSittingLocations count]);
}

-(void) privateSetupTrains
{
    CCLOG(@"CoasterEngine : privateSetupTrains");
    //Four Trains.
    Train *trainOne = [[Train alloc]init];
    Train *trainTwo = [[Train alloc]init];
    Train *trainThree = [[Train alloc]init];
    Train *trainFour = [[Train alloc]init];
    
    trainOne.trainName = @"TRAIN1";
    trainTwo.trainName = @"TRAIN2";
    trainThree.trainName = @"TRAIN3";
    trainFour.trainName = @"TRAIN4";
    
    //Needs to change... the offset to be correct.
    trainOne.moveOffScreen = [MovementRequester trainExitMovement:TRAIN1 andMyself:self];
    trainTwo.moveOffScreen = [MovementRequester trainExitMovement:TRAIN2 andMyself:self];
    trainThree.moveOffScreen = [MovementRequester trainExitMovement:TRAIN3 andMyself:self];
    trainFour.moveOffScreen = [MovementRequester trainExitMovement:TRAIN4 andMyself:self];
    
    trainOne.moveIntoScreen = [MovementRequester trainEnterMovement:TRAIN1];
    trainTwo.moveIntoScreen = [MovementRequester trainEnterMovement:TRAIN2];
    trainThree.moveIntoScreen = [MovementRequester trainEnterMovement:TRAIN3];
    trainFour.moveIntoScreen = [MovementRequester trainEnterMovement:TRAIN4];
    
    trainOne.trainSprite = [CCSprite spriteWithFile:@"train.png"];
    trainTwo.trainSprite = [CCSprite spriteWithFile:@"train.png"];
    trainThree.trainSprite = [CCSprite spriteWithFile:@"train.png"];
    trainFour.trainSprite = [CCSprite spriteWithFile:@"train.png"];
    
    trainOne.trainSprite.tag = trainOne.trainName;
    trainTwo.trainSprite.tag = trainTwo.trainName;
    trainThree.trainSprite.tag = trainThree.trainName;
    trainFour.trainSprite.tag = trainFour.trainName;
    
    trainOne.trainSprite.position =     ccp(TRAIN_X_START_OFF_SCREEN_OFFSET, TRAIN_Y_POS);
    trainTwo.trainSprite.position =     ccp(TRAIN_X_START_OFF_SCREEN_OFFSET + TRAIN_TWO_STOP_X_POS, TRAIN_Y_POS);
    trainThree.trainSprite.position =   ccp(TRAIN_X_START_OFF_SCREEN_OFFSET + TRAIN_THREE_STOP_X_POS, TRAIN_Y_POS);
    trainFour.trainSprite.position =    ccp(TRAIN_X_START_OFF_SCREEN_OFFSET + TRAIN_FOUR_STOP_X_POS, TRAIN_Y_POS);
    
    trainOne.initalStartLocation =     ccp(TRAIN_X_START_OFF_SCREEN_OFFSET, TRAIN_Y_POS);
    trainTwo.initalStartLocation =     ccp(TRAIN_X_START_OFF_SCREEN_OFFSET + TRAIN_TWO_STOP_X_POS, TRAIN_Y_POS);
    trainThree.initalStartLocation =   ccp(TRAIN_X_START_OFF_SCREEN_OFFSET + TRAIN_THREE_STOP_X_POS, TRAIN_Y_POS);
    trainFour.initalStartLocation =    ccp(TRAIN_X_START_OFF_SCREEN_OFFSET + TRAIN_FOUR_STOP_X_POS, TRAIN_Y_POS);
    
    [_trains addObject:trainOne];
    [_trains addObject:trainTwo];
    [_trains addObject:trainThree];
    [_trains addObject:trainFour];
}

-(void)trainExitComplete:(id)sender{
    CCLOG(@"---> Train Exit Complete (callback) from : %@",sender);
    //Now reset the train.
    
    NSString *trainInfo = [NSString stringWithFormat:@"%@",sender];
    
    if ([trainInfo isEqualToString:@"TRAIN1"])
    {
        Train *t = [self getTrainByArrayLocation:0];
        [t resetInitialPosistion];
        CCLOG(@"--------> reset train one");
    }else if([trainInfo isEqualToString:@"TRAIN2"])
    {
        Train *t = [self getTrainByArrayLocation:1];
        [t resetInitialPosistion];
        CCLOG(@"--------> reset train two");
    }else if([trainInfo isEqualToString:@"TRAIN3"])
    {
        Train *t = [self getTrainByArrayLocation:2];
        [t resetInitialPosistion];
        CCLOG(@"--------> reset train three");
    }else if ([trainInfo isEqualToString:@"TRAIN4"])
    {
        Train *t = [self getTrainByArrayLocation:3];
        [t resetInitialPosistion];
        CCLOG(@"--------> reset train four");
    }
    //else useless data..
    
}

-(void) privateSetupPreBoardingLocations
{
    CCLOG(@"CoasterEngine : privateSetupPreBoardingLocations");
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
            currentYPos = currentYPos + LOADUP_INC_START_Y;
            currentXPos = LOADUP_START_X_POS;
        }
        CGPoint preBoardingPosition = ccp(currentXPos, currentYPos);
        
        
        BoardingLocation *b = [[BoardingLocation alloc]init];
        NSString *locationName = [NSString stringWithFormat:@"LOCATION%d",a];
        b.boardingLocation = locationName;
        b.location = preBoardingPosition;
        b.movementSequence = [MovementRequester moveDirectToLocationByPoint:preBoardingPosition];
        [_preBoardingLocations addObject: b];
        
        CCLOG(@"---> Setting preboardLocation: %@ : x:%.f y:%.f : arraySize :%d", locationName, preBoardingPosition.x, preBoardingPosition.y, [_preBoardingLocations count]);
        currentXPos = currentXPos + LOADUP_INC_START_X;
    }
    CCLOG(@"CoasterEngine : PreBoardLocations all added total : %d", [_preBoardingLocations count]);
}

-(void)privateSetupRiderMap
{
    CCLOG(@"CoasterEngine : privateSetupRiderMap");

    //Load up the Ten object
    for (int a =0; a < 10;a++)
    {
        NSString *riderTag = [NSString stringWithFormat:@"RIDER_TAG_%d",a];
        CCLOG(@"Loading in sprite : %@",riderTag);
        
        CCSprite *rider = [CCSprite spriteWithFile:@"1_yellowHD.png"];
        rider.tag = riderTag;
        
        CGPoint riderPosition = ccp(RIDERS_START_X_POS, RIDERS_START_Y_POS);
        CCLOG(@"---> Setting inital sprite pos x:%.f y:%.f", riderPosition.x, riderPosition.y);
        
        rider.position = riderPosition;
        rider.zOrder = RIDERS_Z_POS;
        
        //Now add to the map
        [_ridersMap setObject:rider forKey:riderTag];
    }
}

-(OnTrainLocation*)getOnTrainLocationByArrayLocation:(int)arrayLocation
{
    OnTrainLocation* o = [_trainSittingLocations objectAtIndex:arrayLocation];
    CCLOG(@"Return trainSittingLocation : %@", o.trainSeatLocation);
    return o;
}

-(BoardingLocation*)getBoardingInfoByArrayLocation:(int)arrayLocation
{
    BoardingLocation* b = [_preBoardingLocations objectAtIndex:arrayLocation];
    CCLOG(@"Return boardinglocation : %@", b.boardingLocation);
    return b;
}

-(Train*) getTrainByArrayLocation:(int)arrayLocation;
{
    Train *t = [_trains objectAtIndex:arrayLocation];
    CCLOG(@"Returning TrainLocation : %@", t.trainName);
    return t;
}



-(BOOL) isAlive
{
    return YES;
}

-(CCSprite *)getSpriteForKey:(id)key
{
    CCLOG(@"CoasterEngine : getSpriteForKey : %@", key);
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

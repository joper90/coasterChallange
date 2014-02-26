//
//  GameLayer.m
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "GameLayer.h"
#import "CoasterEngine.h"


@implementation GameLayer

-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"GameLayer : init()");
        //Yes handling enabled for this layer
        [[[CCDirector sharedDirector]touchDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
       
        //Now display each element on the screen
        //Show GoButton
        [[CoasterEngine instance]setTrainState:WAITING_FOR_STATION];
        
        [self loadAndShowGoButton];
        
        //Show the riders (initally off the screen)
        for (id key in [CoasterEngine instance].ridersMap)
        {
            CCSprite *rider = [[CoasterEngine instance]getRiderSpriteByKey:key andUpdateStatus:RIDER_LOST].riderSprite;
            CCLOG(@"----> Adding rider :%@", key);
            [self addChild:rider];
        }
        
        //Show the trains (initally off the screen)
        for (int a=0; a<4 ;a++)
        {
            Train* t = [[CoasterEngine instance]getTrainByArrayLocation:a];
            CCLOG(@"----> Adding train : %@", t.trainName);
            [self addChild:t.trainSprite];
        }
        
        
        //Setup the location txt.
        _locationLocationLocation= [CCLabelTTF labelWithString:[NSString stringWithFormat:@"x:%.f y:%.f",0.0,0.0] fontName:@"ZXSpectrum" fontSize:20];
        _locationLocationLocation.anchorPoint = ccp(0,0);
        _locationLocationLocation.position = ccp(750,20);
        
        [self addChild:_locationLocationLocation];
        
        //Move the riders to the boaring position.
        [self moveToBoarding];
        
	}
	return self;
}

-(void)moveRidersOntoTrain
{
    CCLOG(@"GameLayer : moveRidersOntoTrain()");
    for (id key in [CoasterEngine instance].ridersMap)
    {
        Rider *rider = [[CoasterEngine instance]getRiderSpriteByKey:key andUpdateStatus:RIDER_BOARDED];
        CCSprite *riderSprite = rider.riderSprite;
        CCSequence *seq = [[CoasterEngine instance]getRiderSeatingLocation:rider];
        [riderSprite runAction:seq];
    }
    
}

-(void)moveToBoarding
{
    CCLOG(@"GameLayer : moveToBoarding()");
    int count = 0 ;
    for (id key in [CoasterEngine instance].ridersMap)
    {
        Rider *rider = [[CoasterEngine instance]getRiderSpriteByKey:key andUpdateStatus:RIDER_QUEUED];
        CCSprite *riderSprite = rider.riderSprite;
        BoardingLocation *b = [[CoasterEngine instance]getBoardingInfoByArrayLocation:count++];
        rider.queueLocation = b.location;
        [riderSprite runAction:b.movementSequence];
    }
}

-(void)loadAndShowGoButton
{
    CCLOG(@"GameLayer : loadAndShowGoButton");
    goButton = [CCSprite spriteWithFile:@"1_greenHD.png"];
    goButton.position = ccp(GO_BUTTON_START_X_POS,GO_BUTTON_START_Y_POS);
    goButton.scale = 2;
    [self addChild:goButton];
}

-(void)moveAllTrainsOn
{
    for (Train *t in [CoasterEngine instance].trains)
    {
        [t.trainSprite runAction:t.moveIntoScreen];
    }
}

-(void)moveAllTrainsOff
{
    for (Train *t in [CoasterEngine instance].trains)
    {
        [t.trainSprite runAction:t.moveOffScreen];
    }
}

-(void)moveAllRidersOff
{
    CCLOG(@"GameLayer : moveAllRidersOff()");
    
    for (id key in [CoasterEngine instance].ridersMap)
    {
        Rider *rider = [[CoasterEngine instance]getRiderSpriteByKey:key andUpdateStatus:RIDER_MOVEMENT_OFFSCREEN];
        CCSprite *riderSprite = rider.riderSprite;
        CCSequence *movement = [[CoasterEngine instance]getRiderMovedOffScreenLocation:rider];
        [riderSprite runAction:movement];
    }
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ([CoasterEngine instance].isTrainMoving == YES)
    {
        return YES;
    }
    
    //Change to the main game layer now
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    //Lets see if the goButton was touched.
    if ([self handleGoButton:touchLocation] == NO)
    {
        //Find which mob was touched.
        _currentTag = [[CoasterEngine instance]whichRiderIsTouched:touchLocation];
        
        if (_currentTag == nil)
        {
            CCLOG(@"GameLayer : TouchesBegan() - Nothing selected");
            return YES;
        }
        CCLOG(@"GameLayer : TouchesBegan() called %@", _currentTag);
    
        [[CoasterEngine instance]setRiderInitalTouchedPositionByTag:_currentTag withPosition:touchLocation];
        //I want to deal with this touch.
    
        //Update the HUD with the posistion
        NSString *nowLocation = [NSString stringWithFormat:@"x:%.f y:%.f",touchLocation.x,touchLocation.y];
        [_locationLocationLocation setString:nowLocation];
    }
    return YES;
}

-(BOOL)handleGoButton:(CGPoint) touchLocation
{
    CCLOG(@"GameLayer : handleGoButton");
    if (CGRectContainsPoint(goButton.boundingBox, touchLocation))
    {
        CCLOG(@"--> GoButton touched");
        
        switch ([[CoasterEngine instance]trainState]) {
            case BOARDED:
                [CoasterEngine instance].isTrainMoving =YES;
                //Move the trains off now (THIS IS ATESTING)
                [self moveAllTrainsOff];
                //Now set the state thatn the train is in the station.
                [[CoasterEngine instance]setTrainState:WAITING_FOR_STATION];
                
                //Now set to move the riders with it.
                [self moveAllRidersOff];
                break;
            
            case WAITING_FOR_STATION:
                [CoasterEngine instance].isTrainMoving =YES;
                //Now set the state thatn the train is in the station.
                [self moveAllTrainsOn];
                [[CoasterEngine instance]setTrainState:STOPPED_IN_STATION];
                break;
                
            case STOPPED_IN_STATION:
                [CoasterEngine instance].isTrainMoving = YES;
                [self moveRidersOntoTrain];
                [[CoasterEngine instance]setTrainState:BOARDED];
                break;
                
            default:
                break;
        }

        return YES;
    }
    return NO;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    if (_currentTag != nil)
    {
        //Get all the relevent info from this layer
        CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
        CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
        oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
        oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];

        //Call to update the current rider.
        [[CoasterEngine instance]updateRiderPostionByTag:_currentTag withOldCoords:oldTouchLocation withCoords:touchLocation];
    }
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (_currentTag == nil)
    {
        CCLOG(@"GameLayer : TouchesEnded NIL selected");
    }else
    {
        CCLOG(@"GameLayer : TouchesEnded called for %@",_currentTag);
    }
    _currentTag = nil;
}

@end

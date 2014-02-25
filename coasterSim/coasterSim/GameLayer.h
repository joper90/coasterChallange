//
//  GameLayer.h
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameLayer : CCLayer
{
    CCSprite * goButton;
}
-(void)moveToBoarding;
-(void) loadAndShowGoButton;
-(BOOL) handleGoButton:(CGPoint) touchLocation;

-(void)moveAllTrainsOn;
-(void)moveAllTrainsOff;
-(void)moveRidersOntoTrain;


@property id currentTag;
@property CCLabelTTF *locationLocationLocation;
@property CGPoint *lastTouch;
@end

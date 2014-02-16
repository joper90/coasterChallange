//
//  GameLayer.m
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer

-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"GameLayer : init()");
        //Yes handling enabled for this layer
        [[[CCDirector sharedDirector]touchDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
        
        testMob = [CCSprite spriteWithFile:@"1_yellowHD.png"];
        testMob.position = ccp(400, 400);
        
        [self addChild:testMob];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"HelloworldLayer : Touches() called");
    //Change to the main game layer now

    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    testMob.position = touchLocation;
    
    //I want to deal with this touch.
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    CGPoint newPos = ccpAdd(testMob.position, translation);
    testMob.position = newPos;
}

@end

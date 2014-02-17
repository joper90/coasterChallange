//
//  HelloWorldLayer.m
//  coasterSim
//
//  Created by Joe on 15/02/2014.
//  Copyright com.funkVoodoo 2014. All rights reserved.
//


// Import the interfaces
#import "TitleLayer.h"
#import "Statics.h"
#import "AppDelegate.h"
#import "GameScene.h"

// HelloWorldLayer implementation
@implementation TitleLayer

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
        CCLOG(@"HelloworldLayer : init()");
        //init the touch handler this is for multi touches.
        [[[CCDirector sharedDirector]touchDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
        
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Touch to start.." fontName:@"DayOfTheTentacle" fontSize:54];

		// position the label on the center of the screen
		label.position = [Statics getCenter];
		
		// add the label as a child to this Layer
		[self addChild: label];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"HelloworldLayer : Touches() called");
    //Change to the main game layer now
    CCTransitionFade* ccFade = [CCTransitionFade transitionWithDuration:0.5f scene:[GameScene scene]];
    [[CCDirector sharedDirector]pushScene:ccFade];
    
    //I want to deal with this touch.
    return YES;
}


- (void) dealloc
{

}

@end

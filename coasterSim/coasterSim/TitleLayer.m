//
//  HelloWorldLayer.m
//  coasterSim
//
//  Created by Joe on 15/02/2014.
//  Copyright com.funkVoodoo 2014. All rights reserved.
//


// Import the interfaces
#import "TitleLayer.h"
#import "AppDelegate.h"

// HelloWorldLayer implementation
@implementation TitleLayer

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"HelloworldLayer : init()");
        //init the touch handler this is for multi touches.
        self.touchEnabled = YES;
        
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Press a key to Start.." fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
	}
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CCLOG(@"HelloworldLayer : Touches() called");
}


- (void) dealloc
{

}

@end

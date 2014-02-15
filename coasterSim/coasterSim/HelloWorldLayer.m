//
//  HelloWorldLayer.m
//  coasterSim
//
//  Created by Joe on 15/02/2014.
//  Copyright com.funkVoodoo 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "AppDelegate.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// on "init" you need to initialize your instance
-(id) init
{
    //init the touch handler
    self.touchEnabled = YES;
    
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
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
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{

}

@end

//
//  MainScene.m
//  coasterSim
//
//  Created by Joe on 15/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "TitleScene.h"

#import "TitleLayer.h"
#import "CoasterEngine.h"

@implementation TitleScene


// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
    CCLOG(@"TitleScene : +scene node");
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TitleLayer *layer = [TitleLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
    //init the Engine.
    BOOL worked = [[CoasterEngine instance]isAlive];
    
    CCLOG(@"TitleScene : is Engine Alive %d", worked);
    
	// return the scene
	return scene;
}


@end

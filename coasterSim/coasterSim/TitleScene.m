//
//  MainScene.m
//  coasterSim
//
//  Created by Joe on 15/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "TitleScene.h"

@implementation TitleScene


// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TitleLayer *layer = [TitleLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


@end
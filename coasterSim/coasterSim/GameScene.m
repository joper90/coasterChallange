//
//  GameScene.m
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "GameScene.h"
#import "BG_GameLayer.h"
#import "GameLayer.h"
#import "FG_GameLayer.h"
#import "Statics.h"

@implementation GameScene
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
    CCLOG(@"GameScene : +scene node");
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
    BG_GameLayer *bgGameLayer = [BG_GameLayer node];
    GameLayer *gameLayer = [GameLayer node];
    FG_GameLayer *fgGameLayer = [FG_GameLayer node];
    
    [scene addChild:bgGameLayer z:Z_BG_GAME_LAYER tag:TAG_BG_GAME_LAYER];
    [scene addChild:gameLayer z:Z_GAME_LAYER tag:TAG_GAME_LAYER];
    [scene addChild:fgGameLayer z:Z_FG_GAME_LAYER tag:TAG_FG_GAME_LAYER];

	
	// return the scene
	return scene;
}

@end

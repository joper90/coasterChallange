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
#import "CoasterEngine.h"

@implementation GameScene
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
    CCLOG(@"GameScene : +scene node");
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
    //Setup the node information.
    
    int currentXPos = LOADUP_START_X_POS;
    int currentYPos = LOADUP_START_Y_POS;
    
    //Load up the Ten object
    for (int a =0; a < 10;a++)
    {
        NSString *riderTag = [NSString stringWithFormat:@"RIDER_TAG_%d",a];
        CCLOG(@"Loading in sprite : %@",riderTag);
        
        CCSprite *rider = [CCSprite spriteWithFile:@"1_yellowHD.png"];
        rider.tag = riderTag;
        
        //If at 5 (well 4) then we need to incremen the y position to start the
        // next row.
        if (a == 5)
        {
            currentYPos = currentYPos + INC_START_Y;
            currentXPos = LOADUP_START_X_POS;
        }
        
        CGPoint riderPosition = ccp(currentXPos, currentYPos);
        CCLOG(@"---> Setting inital sprite pos x:%f y:%f", riderPosition.x, riderPosition.y);
        
        rider.position = riderPosition;
        
        //Now add to the map
        [[CoasterEngine instance].ridersMap setObject:rider forKey:riderTag];
        
        currentXPos = currentXPos + INC_START_X;
    }

    
    
    
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

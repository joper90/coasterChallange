//
//  Statics.h
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Statics : NSObject


//Elements Z level Tag from 100 up
//Lower is at the back -1 0 1 - BG / game / fg
#define Z_BG_GAME_LAYER       100
#define Z_GAME_LAYER          101
#define Z_FG_GAME_LAYER        102

//Tags starting from 100 up
#define TAG_BG_GAME_LAYER   100
#define TAG_GAME_LAYER      101
#define TAG_FG_GAME_LAYER   102


//Game Info.
#define LENGHT_OF_A_DAY     120 //Time it takes for a day to pass, initally for testing 2 mins.
#define INITIAL_TIME_FOR_RIDE_COUNT_DOWN    20 // Time in seconds the ride to wait before needing to leave, over = game over

#define LOADUP_START_X_POS  80
#define LOADUP_START_Y_POS  220
#define INC_START_X         100
#define INC_START_Y         80


//External static strings.
extern NSString *const COMPANY_NAME;
extern NSString *const COMPANY_SUBTEXT;
extern NSString *const COPYRIGHT_MESSAGE;




//Static Methods
+(CGSize) getScreenSize;
+(CGPoint) getCenter;
@end

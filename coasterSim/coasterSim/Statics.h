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
#define Z_BG_GAME_LAYER             100
#define Z_GAME_LAYER                101
#define Z_FG_GAME_LAYER             102

//Tags starting from 100 up
#define TAG_BG_GAME_LAYER           100
#define TAG_GAME_LAYER              101
#define TAG_FG_GAME_LAYER           102


//Game Info.
#define LENGHT_OF_A_DAY             120 //Time it takes for a day to pass, initally for testing 2 mins.
#define INITIAL_TIME_FOR_RIDE_COUNT_DOWN    20 // Time in seconds the ride to wait before needing to leave, over = game over

//Location for where the people queue
#define LOADUP_START_X_POS          80
#define LOADUP_START_Y_POS          220
#define LOADUP_INC_START_X          100
#define LOADUP_INC_START_Y          80

//Location of where the riders sit on the 'train'
#define SIT_START_X_POS             80
#define SIT_START_Y_POS             400
#define SIT_INC_START_X             100
#define SIT_INC_START_Y             80


//Where the riders start from, note off the bottom of the screen.
#define RIDERS_START_X_POS          140
#define RIDERS_START_Y_POS          -100
#define RIDERS_Z_POS                100

//Locations of where the rider move to when exiting the screen.
#define RIDER_EXIT_OFFSCREEN_XPOS_START 1400
#define RIDER_EXIT_OFFSCREEN_INC_X_POS  140
#define RIDER_EXIT_OFFSCREEN_INC_Y_POS  80

//Go button location
#define GO_BUTTON_START_X_POS          950
#define GO_BUTTON_START_Y_POS          270

//Train information
#define TRAIN_ONE_STOP_X_POS            100
#define TRAIN_TWO_STOP_X_POS            350
#define TRAIN_THREE_STOP_X_POS            600
#define TRAIN_FOUR_STOP_X_POS            850

#define TRAIN_X_START_OFF_SCREEN_OFFSET        1400
#define TRAIN_X_END_OFF_SCREEN_OFFSET          -200
#define TRAIN_Y_POS                     450

#define TRAIN_ENTER_TIME                2
#define TRAIN_EXIT_TIME                 2

//External static strings.
extern NSString *const COMPANY_NAME;
extern NSString *const COMPANY_SUBTEXT;
extern NSString *const COPYRIGHT_MESSAGE;




//Static Methods
+(CGSize) getScreenSize;
+(CGPoint) getCenter;
@end

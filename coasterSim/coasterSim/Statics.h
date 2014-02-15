//
//  Statics.h
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

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

//External static strings.
extern NSString *const COMPANY_NAME;
extern NSString *const COMPANY_SUBTEXT;
extern NSString *const COPYRIGHT_MESSAGE;
@end

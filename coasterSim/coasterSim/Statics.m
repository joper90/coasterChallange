//
//  Statics.m
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "Statics.h"

@implementation Statics

NSString *const COMPANY_NAME = @"funkVoodoo";
NSString *const COMPANY_SUBTEXT = @"productions";
NSString *const COPYRIGHT_MESSAGE = @"(c) 2014 funkVoodoo";

NSString *const JSON_FILE = @"levelData.json";

+(CGSize) getScreenSize
{
    return [[CCDirector sharedDirector] winSize];
}

+(CGPoint) getCenter
{
    // ask director for the window size
    CGSize size = [[CCDirector sharedDirector] winSize];
	
    // position the label on the center of the screen
    return ccp( size.width /2 , size.height/2 );
}


@end

//
//  CoasterEngine.h
//  coasterSim
//
//  Created by Joe on 16/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Statics.h"

@interface CoasterEngine : NSObject
{
    
}
//singleton of the engine
+(CoasterEngine*) instance;

-(BOOL)isAlive;
@end

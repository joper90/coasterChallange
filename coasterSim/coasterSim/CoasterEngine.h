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

@property NSMutableDictionary *ridersMap;


//singleton of the engine
+(CoasterEngine*) instance;

-(BOOL)isAlive;
-(CCSprite*) getSpriteForKey:(id)key;
-(NSInteger) whichRiderIsTouched:(CGPoint) touchLocation;
-(void) updateRiderPositionByTag:(id) riderTag withPosition:(CGPoint) location;
@end

//
//  Rider.h
//  coasterSim
//
//  Created by Joe on 25/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Rider : NSObject

@property CGPoint initialLocation;
@property NSString *tag;
@property CCSprite *riderSprite;
@property BOOL boarded;
@property BOOL seatLocked;

-(id)initWithTag:(NSString*)riderTag andWithSprite:(CCSprite*) sprite andInitalocation:(CGPoint) location;
-(void)resetRiderLocation;
@end

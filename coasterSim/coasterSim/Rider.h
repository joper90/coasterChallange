//
//  Rider.h
//  coasterSim
//
//  Created by Joe on 25/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum
{
    RIDER_LOST =0,
    RIDER_QUEUED,
    RIDER_BOARDED,
    RIDER_LOCKED_IN,
    RIDER_MOVEMENT_OFFSCREEN,
    RIDER_WAITING,
    RIDER_LEFT_RIDE
}RiderState;


@interface Rider : NSObject

@property CGPoint initialLocation;
@property CGPoint queueLocation;
@property CGPoint seatedLocation;
@property NSString *tag;
@property CCSprite *riderSprite;
@property BOOL boarded;
@property BOOL seatLocked;
@property RiderState riderState;

-(id)initWithTag:(NSString*)riderTag andWithSprite:(CCSprite*) sprite andInitalocation:(CGPoint) location;
-(void)resetRiderLocation;
-(id)setSeatingLocationAndGetMovement:(id)callbackId;
@end

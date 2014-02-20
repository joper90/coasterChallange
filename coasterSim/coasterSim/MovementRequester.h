//
//  MovementRequester.h
//  coasterSim
//
//  Created by Joe on 19/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Train.h"

@interface MovementRequester : CCNode {
    
}

+(id) moveDirectToLocationByPoint:(CGPoint) location;
+(id) trainEnterMovement:(TrainRequest) trainTypeRequest;
+(id) trainExitMovement:(TrainRequest)trainRequestType andMyself:(id) myself;
                                        

@end

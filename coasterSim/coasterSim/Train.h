//
//  Train.h
//  coasterSim
//
//  Created by Joe on 19/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
    TRAIN1 = 0,
    TRAIN2,
    TRAIN3,
    TRAIN4
} TrainRequest;

@interface Train : NSObject
{
    
}

@property CCSprite *trainSprite;
@property NSString *trainName;
@property CCSequence *moveIntoScreen;
@property CCSequence *moveOffScreen;
@property CGPoint initalStartLocation;

@end

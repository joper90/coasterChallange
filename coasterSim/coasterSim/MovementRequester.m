//
//  MovementRequester.m
//  coasterSim
//
//  Created by Joe on 19/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "MovementRequester.h"
#import "Train.h"
#import "Statics.h"


@implementation MovementRequester


+(id)moveDirectToLocationByPoint:(CGPoint)location
{
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:1 position:location];
    return moveTo;
}

+(id) moveRiderOntoTrain:(CGPoint)location andMyself:(id)myself withRiderNumber:(int) riderId
{
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:1 position:location];
    CCCallFuncO *callback = [CCCallFuncO actionWithTarget:myself selector:@selector(riderBoardedComplete:) object:[NSString stringWithFormat:@"RIDER_TAG_%d",riderId]];
    CCSequence *seq = [CCSequence actions:moveTo, callback, nil];
    return seq;
}

+(id)trainEnterMovement:(TrainRequest)trainTypeRequest andMyself:(id)myself
{
    CCMoveTo *moveTo;
    CCCallFuncO *trainFinished = nil;
    CCSequence *seq = nil;
    
    switch (trainTypeRequest) {
        case TRAIN1:
            moveTo = [CCMoveTo actionWithDuration:TRAIN_ENTER_TIME position:ccp(TRAIN_ONE_STOP_X_POS, TRAIN_Y_POS)];
            trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainEnterComplete:) object:@"TRAIN1"];
            seq = [CCSequence actions:moveTo, trainFinished, nil];
            return seq;
            
        case TRAIN2:
            //delay = [CCDelayTime actionWithDuration:0.1f];
            moveTo = [CCMoveTo actionWithDuration:TRAIN_ENTER_TIME position:ccp(TRAIN_TWO_STOP_X_POS, TRAIN_Y_POS)];
            trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainEnterComplete:) object:@"TRAIN2"];
            seq = [CCSequence actions:moveTo, trainFinished, nil];
            return seq;
        
        case TRAIN3:
           // delay = [CCDelayTime actionWithDuration:0.2f];
            moveTo = [CCMoveTo actionWithDuration:TRAIN_ENTER_TIME position:ccp(TRAIN_THREE_STOP_X_POS, TRAIN_Y_POS)];
            trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainEnterComplete:) object:@"TRAIN3"];
            seq = [CCSequence actions:moveTo, trainFinished, nil];
            return seq;
            
        case TRAIN4:
           // delay = [CCDelayTime actionWithDuration:0.3f];
            moveTo = [CCMoveTo actionWithDuration:TRAIN_ENTER_TIME position:ccp(TRAIN_FOUR_STOP_X_POS, TRAIN_Y_POS)];
            trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainEnterComplete:) object:@"TRAIN4"];
            seq = [CCSequence actions:moveTo, trainFinished, nil];
            return seq;
            
    }
    
    return nil;
}


+(id)trainExitMovement:(TrainRequest)trainRequestType andMyself:(id)myself
{
    CCMoveTo *m = nil;
    CCCallFuncO *trainFinished = nil;
    CCSequence *seq = nil;
    
    switch (trainRequestType) {
        case TRAIN1:
                m = [CCMoveTo actionWithDuration:TRAIN_EXIT_TIME position:ccp(TRAIN_X_END_OFF_SCREEN_OFFSET - TRAIN_FOUR_STOP_X_POS,TRAIN_Y_POS)];
                trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainExitComplete:) object:@"TRAIN1"];
                seq = [CCSequence actions:m, trainFinished, nil];
                return seq;
        case TRAIN2:
                m = [CCMoveTo actionWithDuration:TRAIN_EXIT_TIME position:ccp(TRAIN_X_END_OFF_SCREEN_OFFSET - TRAIN_THREE_STOP_X_POS,TRAIN_Y_POS)];
                trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainExitComplete:) object:@"TRAIN2"];
                seq = [CCSequence actions:m, trainFinished, nil];
                return seq;
        case TRAIN3:
                m = [CCMoveTo actionWithDuration:TRAIN_EXIT_TIME position:ccp(TRAIN_X_END_OFF_SCREEN_OFFSET - TRAIN_TWO_STOP_X_POS,TRAIN_Y_POS)];
            trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainExitComplete:) object:@"TRAIN3"];
                seq = [CCSequence actions:m, trainFinished, nil];
                return seq;
        case TRAIN4:
                m = [CCMoveTo actionWithDuration:TRAIN_EXIT_TIME position:ccp(TRAIN_X_END_OFF_SCREEN_OFFSET - TRAIN_ONE_STOP_X_POS,TRAIN_Y_POS)];
                trainFinished = [CCCallFuncO actionWithTarget:myself selector:@selector(trainExitComplete:) object:@"TRAIN4"];

                seq = [CCSequence actions:m, trainFinished, nil];
                return seq;
    }
    return nil;
}
@end

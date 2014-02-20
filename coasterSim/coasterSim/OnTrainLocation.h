//
//  OnTrainLocation.h
//  coasterSim
//
//  Created by Joe on 19/02/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OnTrainLocation : NSObject
{
    
}

@property NSString  *trainSeatLocation;
@property CGPoint   location;
@property BOOL      taken;
@property id        movementSequence;

@end

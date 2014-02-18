//
//  GameLayer.m
//  coasterSim
//
//  Created by Joe Humphries on 15/02/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "GameLayer.h"
#import "CoasterEngine.h"


@implementation GameLayer

-(id) init
{
	if( (self=[super init]) ) {
		
        CCLOG(@"GameLayer : init()");
        //Yes handling enabled for this layer
        [[[CCDirector sharedDirector]touchDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
       
        //Now display each element on the screen
        
        for (id key in [CoasterEngine instance].ridersMap)
        {
            CCSprite *rider = [[CoasterEngine instance]getSpriteForKey:key];
            [self addChild:rider];
        }
        
        //Setup the location txt.
        _locationLocationLocation= [CCLabelTTF labelWithString:[NSString stringWithFormat:@"x:%.f y:%.f",0.0,0.0] fontName:@"ZXSpectrum" fontSize:20];
        _locationLocationLocation.anchorPoint = ccp(0,0);
        _locationLocationLocation.position = ccp(750,20);
        
        [self addChild:_locationLocationLocation];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
 
    //Change to the main game layer now
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    //Find which mob was touched.
    _currentTag = [[CoasterEngine instance]whichRiderIsTouched:touchLocation];
    
    CCLOG(@"GameLayer : TouchesBegan() called %@", _currentTag);
    
    [[CoasterEngine instance]setRiderInitalTouchedPositionByTag:_currentTag withPosition:touchLocation];
    //I want to deal with this touch.
    
    //Update the HUD with the posistion
    NSString *nowLocation = [NSString stringWithFormat:@"x:%.f y:%.f",touchLocation.x,touchLocation.y];
    [_locationLocationLocation setString:nowLocation];
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    //Get all the relevent info from this layer
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];

    //Call to update the current rider.
    [[CoasterEngine instance]updateRiderPostionByTag:_currentTag withOldCoords:oldTouchLocation withCoords:touchLocation];
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"GameLayer : TouchesEnded called for %@",_currentTag);
}

@end

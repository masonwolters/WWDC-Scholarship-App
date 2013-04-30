//
//  ScrollAnimateItem.m
//  About Me
//
//  Created by Mason Wolters on 4/29/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ScrollAnimateItem.h"

@implementation ScrollAnimateItem

@synthesize view;
@synthesize startOpacity;
@synthesize startPoint = _startPoint;
@synthesize startScale;
@synthesize startScrollPosition;
@synthesize finishOpacity;
@synthesize finishPoint = _finishPoint;
@synthesize finishScale;
@synthesize finishScrollPosition;
@synthesize pointsSet;
@synthesize secondPointsSet;
@synthesize secondFinishOpacity;
@synthesize secondFinishPoint = _secondFinishPoint;
@synthesize secondFinishScale;
@synthesize secondFinishScrollPosition;
@synthesize secondStartScrollPosition;
@synthesize thirdFinishOpacity;
@synthesize thirdFinishPoint = _thirdFinishPoint;
@synthesize thirdFinishScale;
@synthesize thirdFinishScrollPosition;
@synthesize thirdPointsSet;
@synthesize thirdStartScrollPosition;

- (id)init {
    self = [super init];
    
    startOpacity = NAN;
    startScale = NAN;
    startScrollPosition = NAN;
    finishOpacity = NAN;
    finishScale = NAN;
    finishScrollPosition = NAN;
    
    secondStartScrollPosition = NAN;
    secondFinishScrollPosition = NAN;
    secondFinishOpacity = NAN;
    secondFinishScale = NAN;
    
    thirdStartScrollPosition = NAN;
    thirdFinishScrollPosition = NAN;
    thirdFinishOpacity = NAN;
    thirdFinishScale = NAN;
    
    pointsSet = NO;
    secondPointsSet = NO;
    thirdPointsSet = NO;
    
    return self;
}

- (void)setStartingValuesOpacity:(float)opacity scale:(float)scale point:(CGPoint)point {
    self.startOpacity = opacity;
    self.startScale = scale;
    self.startPoint = point;
}


- (void)addFirstKeyframeForStartScroll:(float)start finish:(float)finish opacity:(float)opacity scale:(float)scale point:(CGPoint)point {
    self.startScrollPosition = start;
    self.finishScrollPosition = finish;
    self.finishOpacity = opacity;
    self.finishScale = scale;
    self.finishPoint = point;
}

- (void)addSecondKeyframeForStartScroll:(float)start finish:(float)finish opacity:(float)opacity scale:(float)scale point:(CGPoint)point {
    self.secondStartScrollPosition = start;
    self.secondFinishScrollPosition = finish;
    self.secondFinishOpacity = opacity;
    self.secondFinishScale = scale;
    self.secondFinishPoint = point;
}

- (void)addThirdKeyframeForStartScroll:(float)start finish:(float)finish opacity:(float)opacity scale:(float)scale point:(CGPoint)point {
    self.thirdStartScrollPosition = start;
    self.thirdFinishScrollPosition = finish;
    self.finishOpacity = opacity;
    self.finishScale = scale;
    self.finishPoint = point;
}

- (void)setStartPoint:(CGPoint)startPoint1 {
    _startPoint = startPoint1;
    pointsSet = YES;
}

- (void)setFinishPoint:(CGPoint)finishPoint1 {
    _finishPoint = finishPoint1;
    pointsSet = YES;
}

- (void)setSecondFinishPoint:(CGPoint)secondFinishPoint1 {
    _secondFinishPoint = secondFinishPoint1;
    secondPointsSet = YES;
}

- (void)setThirdFinishPoint:(CGPoint)thirdFinishPoint1 {
    _thirdFinishPoint = thirdFinishPoint1;
    thirdPointsSet = YES;
}

@end

//
//  ScrollAnimateItem.h
//  About Me
//
//  Created by Mason Wolters on 4/29/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollAnimateItem : NSObject

@property (strong, nonatomic) UIView *view;

@property (nonatomic) float startOpacity;
@property (nonatomic) float startScale;
@property (nonatomic) CGPoint startPoint;

@property (nonatomic) float finishOpacity;
@property (nonatomic) float finishScale;
@property (nonatomic) CGPoint finishPoint;

@property (nonatomic) float secondFinishOpacity;
@property (nonatomic) float secondFinishScale;
@property (nonatomic) CGPoint secondFinishPoint;

@property (nonatomic) BOOL pointsSet;
@property (nonatomic) BOOL secondPointsSet;

@property (nonatomic) float startScrollPosition;
@property (nonatomic) float finishScrollPosition;

@property (nonatomic) float secondStartScrollPosition;
@property (nonatomic) float secondFinishScrollPosition;

@property (nonatomic) float thirdStartScrollPosition;
@property (nonatomic) float thirdFinishScrollPosition;

@property (nonatomic) float thirdFinishOpacity;
@property (nonatomic) float thirdFinishScale;
@property (nonatomic) CGPoint thirdFinishPoint;
@property (nonatomic) BOOL thirdPointsSet;

- (id)init; 

- (void)setStartingValuesOpacity:(float)opacity scale:(float)scale point:(CGPoint)point;
- (void)addFirstKeyframeForStartScroll:(float)start finish:(float)finish opacity:(float)opacity scale:(float)scale point:(CGPoint)point;
- (void)addSecondKeyframeForStartScroll:(float)start finish:(float)finish opacity:(float)opacity scale:(float)scale point:(CGPoint)point;
- (void)addThirdKeyframeForStartScroll:(float)start finish:(float)finish opacity:(float)opacity scale:(float)scale point:(CGPoint)point;

@end

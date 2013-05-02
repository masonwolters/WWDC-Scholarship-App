//
//  ImageAnimateItem.h
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ScrollAnimateItem.h"
#import <QuartzCore/QuartzCore.h>

@protocol ImageAnimateItemDelegate <NSObject>

@optional
- (void)tapSailingVideo;
- (void)tapWhirlygigVideo;
- (void)tapTimelapseVideo;
- (void)tapTypographyVideo;
- (void)tapTempleRunVideo;

@end

@interface ImageAnimateItem : ScrollAnimateItem

@property (nonatomic) float yPosition;
@property (strong, nonatomic) NSObject<ImageAnimateItemDelegate> *delegate;

- (id)initWithImageName:(NSString*)imageName yPosition:(float)yPos width:(float)width;

- (void)addGestureRecognizerForSailingVideo;
- (void)addGestureRecognizerForWhirlygigVideo;
- (void)addGestureRecognizerForTimelapseVideo;
- (void)addGestureRecognizerForTypographyVideo;
- (void)addGestureRecognizerForTempleRunVideo;

@end

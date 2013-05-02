//
//  HeaderAnimateItem.h
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ScrollAnimateItem.h"
#import <QuartzCore/QuartzCore.h>

@interface HeaderAnimateItem : ScrollAnimateItem

@property (nonatomic) float yPosition;

- (id)initWithTitle:(NSString*)title yPosition:(float)yPos;

@end

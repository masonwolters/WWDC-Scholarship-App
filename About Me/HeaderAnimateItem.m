//
//  HeaderAnimateItem.m
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "HeaderAnimateItem.h"

@implementation HeaderAnimateItem

@synthesize yPosition;

- (id)initWithTitle:(NSString *)title yPosition:(float)yPos {
    self = [super init];
    
    self.yPosition = yPos;
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(-10, yPos, 300, 50)];
    textView.backgroundColor = [UIColor clearColor];
    textView.text = title;
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:20.0f];
    textView.layer.zPosition = 1.1f;
    self.view = textView;
    
    [self setStartingValuesOpacity:1.0f scale:.8f point:CGPointMake(0, 0)];
    [self addFirstKeyframeForStartScroll:yPos - 20 finish:yPos - 10 opacity:1.0f scale:1.0f point:CGPointMake(20, 0)];
    [self addSecondKeyframeForStartScroll:yPos - 10 finish:yPos + 15 opacity:1.0f scale:1.0f point:CGPointMake(20, 25)];

    
    return self;
}

@end

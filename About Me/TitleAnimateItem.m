//
//  TitleAnimateItem.m
//  About Me
//
//  Created by Mason Wolters on 4/30/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "TitleAnimateItem.h"

@implementation TitleAnimateItem

- (id)initWithTitle:(NSString *)title {
    self = [super init];
    
    UIView *viewTitle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    viewTitle.backgroundColor = [UIColor clearColor];
    UITextView *titleItem = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, viewTitle.frame.size.width, 150)];
    titleItem.backgroundColor = [UIColor clearColor];
    titleItem.editable = NO;
    titleItem.text = title;
    titleItem.font = [UIFont systemFontOfSize:40.0f];
    titleItem.textAlignment = NSTextAlignmentCenter;
    [viewTitle addSubview:titleItem];
    
    self.view = viewTitle;
    self.startOpacity = 1.0f;
    self.finishOpacity = 1.0f;
    self.startPoint = CGPointMake(0, 0);
    self.finishPoint = CGPointMake(0, 20);
    self.startScale = 1.0f;
    self.finishScale = 1.0f;
    self.secondFinishScale = 1.5f;
    self.secondFinishPoint = CGPointMake(0, 20);
    self.startScrollPosition = 0.0f;
    self.finishScrollPosition = 20.0f;
    self.secondStartScrollPosition = 20.0f;
    self.secondFinishScrollPosition = 40.0f;
    self.secondFinishOpacity = 0.0f;
    
    self.view.backgroundColor = [UIColor clearColor];
    self.view.layer.zPosition = 1.0f;
    
    return self;
}

@end

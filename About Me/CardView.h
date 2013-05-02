//
//  CardView.h
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *text;

- (id)initWithTitle:(NSString *)title text:(NSString*)text frame:(CGRect)frame automaticHeight:(BOOL)autoHeight;

@end

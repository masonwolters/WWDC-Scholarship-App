//
//  TimelineView.m
//  About Me
//
//  Created by Mason Wolters on 4/29/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "TimelineView.h"

@implementation TimelineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        UIImage *rightArrowImg = [UIImage imageNamed:@"arrow_right.png"];
        
        UIImageView *leftArrow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        leftArrow.center = CGPointMake(leftArrow.frame.size.width/2, self.frame.size.height/2);
        leftArrow.image = rightArrowImg;
        leftArrow.transform = CGAffineTransformMakeRotation(M_PI);
        [self addSubview:leftArrow];
        
        UIImageView *rightArrow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, leftArrow.frame.size.width, leftArrow.frame.size.height)];
        rightArrow.center = CGPointMake(self.frame.size.width - rightArrow.frame.size.width/2, self.frame.size.height/2);
        rightArrow.image = rightArrowImg;
        [self addSubview:rightArrow];
        
        UIImage *dotImg = [UIImage imageNamed:@"timeline_dot.png"];
        UIImageView *dot1 = [[UIImageView alloc] initWithFrame:CGRectMake(40, self.frame.size.height/2 - 20, 10, 10)];
        dot1.image = dotImg;
        [self addSubview:dot1];
        
        UIImageView *slider = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
        slider.image = [UIImage imageNamed:@"timeline_slider.png"];
        slider.center = CGPointMake(45, self.frame.size.height/2);
        [self addSubview:slider];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5.0f);
    
    //const CGFloat *topColor = CGColorGetComponents([UIColor blackColor].CGColor);
    //CGFloat topColor[4] = {((float)((0x000000 & 0xFF0000) >> 16))/255.0, ((float)((0x000000 & 0xFF00) >> 8))/255.0, ((float)(0x000000 & 0xFF))/255.0, .5f};
    
    //CGContextSetStrokeColor(context, topColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, rect.origin.x + 10, rect.size.height/2);
    CGContextAddLineToPoint(context, rect.size.width + rect.origin.x - 10, rect.size.height/2);
    CGContextStrokePath(context);
    

    
}


@end

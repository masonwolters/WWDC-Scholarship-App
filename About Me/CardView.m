//
//  CardView.m
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (id)initWithTitle:(NSString *)titleString text:(NSString *)text frame:(CGRect)frame automaticHeight:(BOOL)autoHeight {
    self = [super initWithFrame:frame];
    
    if (self) {

        
        UITextView *title = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - 60, 60)];
        title.text = titleString;
        title.editable = NO;
        title.backgroundColor = [UIColor clearColor];
        title.font = [UIFont systemFontOfSize:18.0f];
        title.frame = CGRectMake(25, 8, frame.size.width - 60, title.contentSize.height);
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        textView.text = text;
        textView.editable = NO;
        textView.scrollEnabled = NO;
        textView.font = [UIFont systemFontOfSize:14.0f];
        textView.backgroundColor = [UIColor clearColor];
        
        if (autoHeight) {
            textView.frame = CGRectMake(title.frame.origin.x, ([titleString isEqualToString:@""] || titleString == nil)? 14 : title.frame.origin.y + title.contentSize.height - 5, frame.size.width - 60, textView.contentSize.height);
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textView.frame.origin.y + textView.contentSize.height + 16);
        } else {
            textView.frame = CGRectMake(title.frame.origin.x, ([titleString isEqualToString:@""] || titleString == nil)? 14 : title.frame.origin.y + title.contentSize.height - 5, frame.size.width - 60, frame.size.height);
            self.frame = frame;
        }
        
        UIImage *cardImage = [[UIImage imageNamed:@"card.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
        UIImageView *cardImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        cardImageView.image = cardImage;
        
        [self addSubview:cardImageView];
        [self addSubview:title];
        [self addSubview:textView];
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

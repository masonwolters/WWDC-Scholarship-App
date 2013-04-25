//
//  ButtonNavigationView.m
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ButtonNavigationView.h"

@implementation ButtonNavigationView

#pragma mark - HandleEvents

- (void)buttonPress {
    if (buttonDown) {
        buttonDown = NO;
        [UIView animateWithDuration:.2 animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
    } else {
        buttonDown = YES;
        [UIView animateWithDuration:.2 animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, self.frame.size.height/2 - heightOfButton/2);
        }];
    }
}

- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx {
    NSLog(@"did select index: %i", idx);
}

- (void)AwesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"animation did open");
}

#pragma mark - UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
//    navButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    navButton.frame = CGRectMake(self.frame.size.width/2 - 35, self.frame.size.height - heightOfButton , heightOfButton, heightOfButton);
//    [navButton setImage:[UIImage imageNamed:@"circle_button.png"] forState:UIControlStateNormal];
//    [navButton setImage:[UIImage imageNamed:@"circle_button_pressed.png"] forState:(UIControlStateHighlighted|UIControlStateNormal)];
//    [navButton addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:navButton];
//    
//    buttons = [NSMutableArray array];
    
    
    AwesomeMenuItem *item1 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"]];
    AwesomeMenuItem *item2 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"]];
    AwesomeMenuItem *item3 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"]];
    AwesomeMenuItem *item4 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"]];
    AwesomeMenuItem *item5 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"]];
    AwesomeMenuItem *item6 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"]];

    
    NSArray *menus = [NSArray arrayWithObjects:item1, item2, item3, item4, item5, item6, nil];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:CGRectMake(100, 100, 320, 200) menus:menus];
    
    menu.startPoint = CGPointMake(60, 150);
    menu.delegate = self;
    [self addSubview:menu];
    
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

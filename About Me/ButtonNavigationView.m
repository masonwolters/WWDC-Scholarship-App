//
//  ButtonNavigationView.m
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ButtonNavigationView.h"

@implementation ButtonNavigationView

@synthesize delegate;

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

#pragma mark - AwesomeMenu Delegate

- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx {
    [self performSelector:@selector(transformUp) withObject:nil afterDelay:.2];
    [delegate didSelectButtonWithIndex:idx];
}

- (void)AwesomeMenuDidStartOpening:(AwesomeMenu *)menu {
    [UIView animateWithDuration:.2 animations:^{
        
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, 150);
        CGAffineTransform scale = CGAffineTransformMakeScale(1, 1);
        self.transform = CGAffineTransformConcat(translate, scale);
    }];
}

- (void)AwesomeMenuDidStartClosing:(AwesomeMenu *)menu {
    
    [self performSelector:@selector(transformUp) withObject:nil afterDelay:.5];
}

- (void)AwesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"animation did open");
}

- (void)transformUp {
    [UIView animateWithDuration:.2 animations:^{
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, 0);
        CGAffineTransform scale = CGAffineTransformMakeScale(.5, .5);
        self.transform = CGAffineTransformConcat(translate, scale);
    }];
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
    
    
    AwesomeMenuItem *item1 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"] ContentImage:nil highlightedContentImage:nil];
    AwesomeMenuItem *item2 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"] ContentImage:nil highlightedContentImage:nil];
    AwesomeMenuItem *item3 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"] ContentImage:nil highlightedContentImage:nil];
    AwesomeMenuItem *item4 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"] ContentImage:nil highlightedContentImage:nil];
    AwesomeMenuItem *item5 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"] ContentImage:nil highlightedContentImage:nil];
    AwesomeMenuItem *item6 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed.png"] ContentImage:nil highlightedContentImage:nil];

//    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
//    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
//    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
//    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
//                                                           highlightedImage:storyMenuItemImagePressed
//                                                               ContentImage:starImage
//                                                    highlightedContentImage:nil];
//    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
//                                                           highlightedImage:storyMenuItemImagePressed
//                                                               ContentImage:starImage
//                                                    highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:item1, item2, item3, item4, item5, item6, nil];
    //NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, nil];
    
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

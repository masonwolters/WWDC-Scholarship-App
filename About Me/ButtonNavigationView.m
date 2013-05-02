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

#pragma mark - Private Methods

-(void)delegateUnDim {
    [delegate shouldUnDim];
}

- (void)switchCenterButtonWithIndex:(int)index {
    CGPoint pointOfOutsideButton = [menu.menusArray[index] endPoint];
    CGPoint pointOfMiddleButton = menu._addButton.center;
    [UIView animateWithDuration:.2 animations:^{
        [menu.menusArray[index] setCenter:pointOfMiddleButton];
        menu._addButton.center = pointOfOutsideButton;
    } completion:^(BOOL finished) {
        //menu._addButton = menu.menusArray[index];
        //[menu.menusArray replaceObjectAtIndex:index withObject:menu._addButton];
    }];
}

- (void)setAddButtonImageBasedOnIndex:(int)index {
    if (index == indexOfEducation) {
        menu._addButton.image = [UIImage imageNamed:@"circle_button_education.png"];
        menu._addButton.highlightedImage = [UIImage imageNamed:@"circle_button_pressed_education.png"];
    } else if (index == indexOfFuture) {
        menu._addButton.image = [UIImage imageNamed:@"circle_button_future.png"];
        menu._addButton.highlightedImage = [UIImage imageNamed:@"circle_button_pressed_future.png"];
    } else if (index == indexOfProfessional) {
        menu._addButton.image = [UIImage imageNamed:@"circle_button_professional.png"];
        menu._addButton.highlightedImage = [UIImage imageNamed:@"circle_button_pressed_professional.png"];
    } else if (index == indexOfProjects) {
        menu._addButton.image = [UIImage imageNamed:@"circle_button_projects.png"];
        menu._addButton.highlightedImage = [UIImage imageNamed:@"circle_button_pressed_projects.png"];
    } else if (index == indexOfTechSkills) {
        menu._addButton.image = [UIImage imageNamed:@"circle_button_tech.png"];
        menu._addButton.highlightedImage = [UIImage imageNamed:@"circle_button_pressed_tech.png"];
    } else if (index == indexOfAboutMe) {
        menu._addButton.image = [UIImage imageNamed:@"circle_button_me.png"];
        menu._addButton.highlightedImage = [UIImage imageNamed:@"circle_button_pressed_me.png"];
    }
    
    CATransition *transition = [CATransition animation];
    transition.duration = .1f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    [menu._addButton.layer addAnimation:transition forKey:nil];
}

#pragma mark - AwesomeMenu Delegate

- (void)AwesomeMenu:(AwesomeMenu *)menu1 didSelectIndex:(NSInteger)idx {
    buttonDown = NO;
    selectedIndex = idx;

    [self performSelector:@selector(transformUp) withObject:nil afterDelay:.2];
    [delegate shouldUnDim];
    [delegate didSelectButtonWithIndex:idx];
    
    
//    NSMutableArray *newMenus = [NSMutableArray arrayWithArray:menu.menusArray];
//    if (![menu.menusArray containsObject:meItem]) {
//        [newMenus replaceObjectAtIndex:idx withObject:meItem];
//
//    } else if (![menu.menusArray containsObject:futureItem]) {
//        [newMenus replaceObjectAtIndex:idx withObject:futureItem];
//    } else if (![menu.menusArray containsObject:projectsItem]) {
//        [newMenus replaceObjectAtIndex:idx withObject:projectsItem];
//    } else if (![menu.menusArray containsObject:professionalItem]) {
//        [newMenus replaceObjectAtIndex:idx withObject:professionalItem];
//    } else if (![menu.menusArray containsObject:educationItem]) {
//        [newMenus replaceObjectAtIndex:idx withObject:educationItem];
//    } else if (![menu.menusArray containsObject:techItem]) {
//        [newMenus replaceObjectAtIndex:idx withObject:techItem];
//    }
//    
//    [menu setMenusArray:newMenus];
    
}

- (void)AwesomeMenuDidStartOpening:(AwesomeMenu *)menu {

    if (buttonDown) {
        [self performSelector:@selector(transformUp) withObject:nil afterDelay:.5];
        buttonDown = NO;
        [delegate shouldUnDim];
    } else {
        [self transformDown];
        [delegate shouldDim];
        buttonDown = YES;
        

    }
    
}

- (void)AwesomeMenuDidStartClosing:(AwesomeMenu *)menu {
    buttonDown = NO;
    [self performSelector:@selector(delegateUnDim) withObject:nil afterDelay:.5];
    [self performSelector:@selector(transformUp) withObject:nil afterDelay:.5];

}

- (void)AwesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"animation did open");
}

- (void)transformUp {
    [UIView animateWithDuration:.2 animations:^{
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, -1 * self.frame.size.height + heightOfButton/2 + 20);
        menu.startPoint = CGPointMake(self.center.x, self.frame.size.height - 43);
        CGAffineTransform scale = CGAffineTransformMakeScale(scaleAmount, scaleAmount);
        self.transform = CGAffineTransformConcat(scale, translate);
        //self.transform = translate;
    }];
    [self setAddButtonImageBasedOnIndex:selectedIndex];


}

- (void)transformDown {

    [UIView animateWithDuration:.2 animations:^{
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, 0);
        menu.startPoint = CGPointMake(self.center.x, self.superview.frame.size.height/2);
        CGAffineTransform scale = CGAffineTransformMakeScale(1, 1);
        self.transform = CGAffineTransformConcat(translate, scale);
    }];
    
    menu._addButton.image = [UIImage imageNamed:@"circle_button_expand.png"];
    menu._addButton.highlightedImage = [UIImage imageNamed:@"circle_button_pressed_expand.png"];
    
    CATransition *transition = [CATransition animation];
    transition.duration = .1f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    [menu._addButton.layer addAnimation:transition forKey:nil];


    
//    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    positionAnimation.duration = 0.5f;
//    positionAnimation.removedOnCompletion = NO;
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPoint startPoint = CGPointMake(self.center.x, self.superview.frame.size.height - 43);
//    CGPoint farPoint = CGPointMake(self.center.x, self.superview.frame.size.height/2 - 20);
//    CGPoint nearPoint = CGPointMake(self.center.x, self.superview.frame.size.height/2 - 10);
//    CGPoint endPoint = CGPointMake(self.center.x, self.superview.frame.size.height/2);
//    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
//    CGPathAddLineToPoint(path, NULL, farPoint.x, farPoint.y);
//    CGPathAddLineToPoint(path, NULL, nearPoint.x, nearPoint.y);
//    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
//    positionAnimation.path = path;
//    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    CGPathRelease(path);
//    
//    [menu.layer addAnimation:positionAnimation forKey:@"position"];
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
    
    //self.backgroundColor = [UIColor blueColor];
    selectedIndex = 0;
    //AwesomeMenuItem *item1 = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button_me.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed_me.png"] ContentImage:nil highlightedContentImage:nil];
    techItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button_tech.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed_tech.png"] ContentImage:nil highlightedContentImage:nil];
    educationItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button_education.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed_education.png"] ContentImage:nil highlightedContentImage:nil];
    futureItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button_future.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed_future.png"] ContentImage:nil highlightedContentImage:nil];
    projectsItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button_projects.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed_projects.png"] ContentImage:nil highlightedContentImage:nil];
    professionalItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button_professional.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed_professional.png"] ContentImage:nil highlightedContentImage:nil];
    
    meItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"circle_button_me.png"] highlightedImage:[UIImage imageNamed:@"circle_button_pressed_me.png"] ContentImage:nil highlightedContentImage:nil];
    
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
    
    NSArray *menus = [NSArray arrayWithObjects:meItem, techItem, educationItem, futureItem, projectsItem, professionalItem, nil];
    //NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, nil];
    
    menu = [[AwesomeMenu alloc] initWithFrame:self.bounds menus:menus];
    
    menu.startPoint = CGPointMake(self.center.x, self.frame.size.height - 43);
    menu.delegate = self;
    [self addSubview:menu];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    view.center = self.center;
    view.backgroundColor = [UIColor orangeColor];
    
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

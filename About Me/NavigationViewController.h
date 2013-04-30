//
//  NavigationViewController.h
//  About Me
//
//  Created by Mason Wolters on 4/25/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonNavigationView.h"
#import "AboutMeViewController.h"
#import "TechSkillsViewController.h"
#import "EducationViewController.h"
#import "ProfessionalViewController.h"
#import "ProjectsViewController.h"
#import "FutureViewController.h"
#import "SKBounceAnimation.h"
#import "TimelineView.h"
#import "ScrollAnimateItem.h"



@interface NavigationViewController : UINavigationController <ButtonNavigationViewDelegate> {
    ButtonNavigationView *buttonNavView;
}

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *dimmingView;

@end

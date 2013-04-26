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

#define indexOfTechSkills 0
#define indexOfEducation 1
#define indexOfFuture 2
#define indexOfProjects 3
#define indexOfProfessional 4

@interface NavigationViewController : UINavigationController <ButtonNavigationViewDelegate> {
    
}

@property (strong, nonatomic) UIView *contentView;

@end

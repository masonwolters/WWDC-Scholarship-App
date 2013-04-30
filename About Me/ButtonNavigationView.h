//
//  ButtonNavigationView.h
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"
#import <QuartzCore/QuartzCore.h>
#import "SKBounceAnimation.h"

#define indexOfAboutMe 0
#define indexOfTechSkills 1
#define indexOfEducation 2
#define indexOfFuture 3
#define indexOfProjects 4
#define indexOfProfessional 5

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define heightOfButton 105 //was88
#define numberOfButtons 6
#define scaleAmount .6

@protocol ButtonNavigationViewDelegate <NSObject>

- (void)didSelectButtonWithIndex:(int)index;
@optional
- (void)shouldDim;
- (void)shouldUnDim;

@end

@interface ButtonNavigationView : UIView <AwesomeMenuDelegate> {
    UIButton *navButton;
    BOOL buttonDown;
    NSMutableArray *buttons;
    AwesomeMenu *menu;
    
    AwesomeMenuItem *techItem;
    AwesomeMenuItem *projectsItem;
    AwesomeMenuItem *educationItem;
    AwesomeMenuItem *professionalItem;
    AwesomeMenuItem *meItem;
    AwesomeMenuItem *futureItem;
}

@property (strong, nonatomic) NSObject<ButtonNavigationViewDelegate> *delegate;

@end

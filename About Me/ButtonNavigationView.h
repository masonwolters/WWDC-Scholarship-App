//
//  ButtonNavigationView.h
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"

#define heightOfButton 105 //was88
#define numberOfButtons 6
#define scaleAmount .6

@protocol ButtonNavigationViewDelegate <NSObject>

- (void)didSelectButtonWithIndex:(int)index;

@end

@interface ButtonNavigationView : UIView <AwesomeMenuDelegate> {
    UIButton *navButton;
    BOOL buttonDown;
    NSMutableArray *buttons;
}

@property (strong, nonatomic) NSObject<ButtonNavigationViewDelegate> *delegate;

@end

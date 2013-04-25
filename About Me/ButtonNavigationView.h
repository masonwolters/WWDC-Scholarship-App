//
//  ButtonNavigationView.h
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"

#define heightOfButton 70
#define numberOfButtons 6

@interface ButtonNavigationView : UIView <AwesomeMenuDelegate> {
    UIButton *navButton;
    BOOL buttonDown;
    NSMutableArray *buttons;
}



@end
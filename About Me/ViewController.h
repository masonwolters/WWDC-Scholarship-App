//
//  ViewController.h
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonNavigationView.h"
#import "AwesomeMenu.h"
#import "AboutMeViewController.h"

@interface ViewController : UIViewController <ButtonNavigationViewDelegate> {
    ButtonNavigationView *buttonNavView;
}



@end

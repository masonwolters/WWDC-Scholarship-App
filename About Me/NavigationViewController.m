//
//  NavigationViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/25/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

#pragma mark - ButtonNavigation Delegate

- (void)didSelectButtonWithIndex:(int)index {
    
}

#pragma mark - UIViewController Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ButtonNavigationView *buttonNav = [[ButtonNavigationView alloc] initWithFrame:CGRectMake(0, -1 * self.view.frame.size.height/2 + heightOfButton/2, self.view.frame.size.width, self.view.frame.size.height)];
    buttonNav.delegate = self;
    [self.view addSubview:buttonNav];
    

    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

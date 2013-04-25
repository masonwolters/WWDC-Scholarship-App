//
//  ViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Handle Events



#pragma mark - UIViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //buttonNavView = [[ButtonNavigationView alloc] initWithFrame:CGRectMake(0, -1 * self.view.frame.size.height + heightOfButton, self.view.frame.size.width, self.view.frame.size.height)];
    buttonNavView = [[ButtonNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //mason test
    //[self.view addSubview:buttonNavView];
    
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
    [self.view addSubview:menu];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

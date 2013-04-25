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

#pragma mark - ButtonNavigationViewDelegate

- (void)didSelectButtonWithIndex:(int)index {
    NSLog(@"did select index: %i", index);
    if (index == 0) {
        //about me
        AboutMeViewController *aboutMe = [[AboutMeViewController alloc] init];
        aboutMe.view.frame = CGRectOffset(aboutMe.view.frame, 0, 20);
        aboutMe.view.alpha = 0.0f;
        aboutMe.view.transform = CGAffineTransformMakeScale(.8, .8);
        [self.view addSubview:aboutMe.view];
        [UIView animateWithDuration:.2f animations:^{
            aboutMe.view.alpha = 1.0f;
            aboutMe.view.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
}

#pragma mark - Handle Events

#pragma mark - UIViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    buttonNavView = [[ButtonNavigationView alloc] initWithFrame:CGRectMake(0, -1 * self.view.frame.size.height/2 + heightOfButton/2, self.view.frame.size.width, self.view.frame.size.height)];
    buttonNavView.delegate = self;
    buttonNavView.transform = CGAffineTransformMakeScale(.5, .5);
    [self.view.window addSubview:buttonNavView];

    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1500, 1500)];
    test.backgroundColor = [UIColor blueColor];
    [self.view.window addSubview:test];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

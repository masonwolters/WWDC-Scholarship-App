//
//  AboutMeViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/25/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "AboutMeViewController.h"

@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

- (id)init {
    self = [super init];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    return self;
}

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

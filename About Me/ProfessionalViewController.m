//
//  ProfessionalViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/26/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ProfessionalViewController.h"

@interface ProfessionalViewController ()

@end

@implementation ProfessionalViewController

#pragma mark - Private Methods

- (void)setupAnimationItems {
    
}

#pragma mark - UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 1000)];
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor greenColor];
    
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

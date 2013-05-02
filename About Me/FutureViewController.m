//
//  FutureViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/26/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "FutureViewController.h"

@interface FutureViewController ()

@end

@implementation FutureViewController

#pragma mark - Private Methods

- (void)setupAnimationItems {
    
    TitleAnimateItem *title = [[TitleAnimateItem alloc] initWithTitle:@"My Future"];
    
    
    HeaderAnimateItem *collegeHeader = [[HeaderAnimateItem alloc] initWithTitle:@"College" yPosition:60.0f];
    
    CardView *collegeCard = [[CardView alloc] initWithTitle:@"Stanford" text:@"Yeah" frame:CGRectMake(0, collegeHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *collegeItem = [[ScrollAnimateItem alloc] init];
    collegeItem.view = collegeCard;
    [collegeItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    
    HeaderAnimateItem *afterCollegeHeader = [[HeaderAnimateItem alloc] initWithTitle:@"After College" yPosition:collegeItem.view.frame.origin.y + collegeItem.view.frame.size.height];
    
    CardView *afterCollegeCard = [[CardView alloc] initWithTitle:nil text:@"yeah" frame:CGRectMake(0, afterCollegeHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *afterCollegeItem = [[ScrollAnimateItem alloc] init];
    afterCollegeItem.view = afterCollegeCard;
    [afterCollegeItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    
    [self setAnimateItems:[NSArray arrayWithObjects: title, collegeHeader, collegeItem, afterCollegeHeader, afterCollegeItem, nil]];
}

#pragma mark - UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 1000)];
    
    self.view.frame = frame;
    self.view.backgroundColor = UIColorFromRGB(backgroundColorHEX);
    
    [self setupAnimationItems];
    
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

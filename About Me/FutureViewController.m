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
    
    CardView *collegeCard = [[CardView alloc] initWithTitle:@"Stanford" text:@"My goal is to go to Stanford for college. I want to go to school in California because I lived there before I moved to Michigan. At this point, I'm thinking about studying computer science." frame:CGRectMake(0, collegeHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *collegeItem = [[ScrollAnimateItem alloc] init];
    collegeItem.view = collegeCard;
    [collegeItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    
    HeaderAnimateItem *afterCollegeHeader = [[HeaderAnimateItem alloc] initWithTitle:@"After College" yPosition:collegeItem.view.frame.origin.y + collegeItem.view.frame.size.height];
    
    CardView *afterCollegeCard = [[CardView alloc] initWithTitle:nil text:@"After college, I want to start a startup. I have an awesome idea for a startup that I think I could make work. I still have a lot to learn about iOS development, and I'm hoping I will continue learning." frame:CGRectMake(0, afterCollegeHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *afterCollegeItem = [[ScrollAnimateItem alloc] init];
    afterCollegeItem.view = afterCollegeCard;
    [afterCollegeItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [afterCollegeItem addFirstKeyframeForStartScroll:84 finish:84+150 opacity:1.0f scale:1.3f point:CGPointMake(0, 110)];
    
    [self setAnimateItems:[NSArray arrayWithObjects: title, collegeHeader, collegeItem, afterCollegeHeader, afterCollegeItem, nil]];
}

#pragma mark - UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 60 + self.view.frame.size.height + -20)];
    
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

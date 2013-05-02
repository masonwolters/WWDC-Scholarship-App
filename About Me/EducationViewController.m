//
//  EducationViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/26/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()

@end

@implementation EducationViewController

#pragma mark - Private Methods

- (void)setupAnimationItems {
    
    TitleAnimateItem *titleItem = [[TitleAnimateItem alloc] initWithTitle:@"Education"];
    
    
    HeaderAnimateItem *codingHeader = [[HeaderAnimateItem alloc] initWithTitle:@"Coding Wise" yPosition:60.0f];
    
    CardView *codingCard = [[CardView alloc] initWithTitle:nil text:@"My foundation in programming comes from when I was just 10 years old. My dad started a FIRST Lego League team for me so I could get experience with technology. Lego League is a national program where teams have two months to design, build, and program a robot made out of Legos to do specific tasks. I was the person who did all of the programming for our robot, and I learned a lot of programming logic from it. It was very basic, but that foundation definitely helps me in my coding today. I have been teaching myself iOS development for the past 8 months. I have an iPhone and I really wanted to make apps for it, so I decided to give it a go. I have a solid understanding of Objective-C now, but I know I still have a ton to learn. Whenever I'm not sailing or skiing, I'm coding." frame:CGRectMake(0, codingHeader.yPosition + 50, self.view.frame.size.width, 440) automaticHeight:NO];
    ScrollAnimateItem *codingItem = [[ScrollAnimateItem alloc] init];
    codingItem.view = codingCard;
    [codingItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    
    HeaderAnimateItem *schoolHeader = [[HeaderAnimateItem alloc] initWithTitle:@"School Wise" yPosition:codingItem.view.frame.origin.y + codingItem.view.frame.size.height];
    
    CardView *schoolCard = [[CardView alloc] initWithTitle:nil text:@"I am an excellent student. I have a 4.0 GPA, and that's even with 2 AP classes. I challenge myself in school and strive for perfection. I'm a member of the National Honor Society. I just recently scored a 33 composite score on my ACT. Whenever I'm bored in classes, I usually design my apps. In fact, the ideas for this app were all thought up while I was at school. (Chemistry is really boring and easy)" frame:CGRectMake(0, schoolHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *schoolItem = [[ScrollAnimateItem alloc] init];
    schoolItem.view = schoolCard;
    [schoolItem setStartingValuesOpacity:1.0f scale:.7f point:CGPointMake(0, 0)];
    [schoolItem addFirstKeyframeForStartScroll:280.0f finish:300.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [schoolItem addSecondKeyframeForStartScroll:434.0f finish:434+150 opacity:1.0f scale:1.3f point:CGPointMake(0, 110)];
    
    [self setAnimateItems:[NSArray arrayWithObjects:titleItem, codingHeader, codingItem, schoolHeader, schoolItem, nil]];
}

#pragma mark - UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 410 + self.view.frame.size.height - 20)];
    
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

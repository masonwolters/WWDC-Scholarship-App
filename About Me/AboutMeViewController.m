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

#pragma mark - Private Methods

- (void)setupAnimationItems {
    UIView *viewIntroduction = [[UIView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 200)];
    UITextView *textIntroduction = [[UITextView alloc] initWithFrame:viewIntroduction.bounds];
    textIntroduction.text = @"My name is Mason Wolters, and I'm an 11th grade student at Spring Lake High School in Spring Lake, Michigan.";
    textIntroduction.editable = NO;
    [viewIntroduction addSubview:textIntroduction];
    
    ScrollAnimateItem *introductionItem = [[ScrollAnimateItem alloc] init];
    introductionItem.view = viewIntroduction;
    introductionItem.startPoint = CGPointMake(0, 0);
    introductionItem.finishPoint = CGPointMake(0, 50);
    introductionItem.startOpacity = 1.0f;
    introductionItem.finishOpacity = 1.0f;
    introductionItem.startScale = 1.0f;
    introductionItem.finishScale = 1.0f;
    introductionItem.secondFinishScale = .7f;
    introductionItem.startScrollPosition = 90.0f;
    introductionItem.finishScrollPosition = 140.0f;
    introductionItem.secondFinishPoint = CGPointMake(320, 100.0f);
    introductionItem.secondStartScrollPosition = 140.0f;
    introductionItem.secondFinishScrollPosition = 190.0f;
    
    UIView *viewInterests = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 200, 100)];
    viewInterests.backgroundColor = [UIColor clearColor];
    UITextView *textInterests = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    textInterests.backgroundColor = [UIColor clearColor];
    textInterests.editable = NO;
    textInterests.text = @"My Interests";
    textInterests.font = [UIFont systemFontOfSize:25.0f];
    [viewInterests addSubview:textInterests];
    
    ScrollAnimateItem *interestsItem = [[ScrollAnimateItem alloc] init];
    interestsItem.view = viewInterests;
    interestsItem.startOpacity = 1.0f;
    interestsItem.finishOpacity = 1.0f;
    interestsItem.startScale = .8f;
    interestsItem.finishScale = 1.0f;
    interestsItem.startPoint = CGPointMake(0, 0);
    interestsItem.finishPoint = CGPointMake(0, 0);
    interestsItem.startScrollPosition = 180.0f;
    interestsItem.finishScrollPosition = 200.0f;
    
    interestsItem.secondFinishPoint = CGPointMake(0, 50);
    interestsItem.secondStartScrollPosition = interestsItem.finishScrollPosition;
    interestsItem.secondFinishScrollPosition = 250.0f;
    interestsItem.secondFinishOpacity = 1.0f;
    interestsItem.thirdFinishOpacity = 1.0f;
    interestsItem.thirdFinishPoint = CGPointMake(-320, 100);
    interestsItem.thirdStartScrollPosition = 250.0f;
    interestsItem.thirdFinishScrollPosition = 300.0f;

    
    TitleAnimateItem *title = [[TitleAnimateItem alloc] initWithTitle:@"About Me"];
    
    [self setAnimateItems:[NSArray arrayWithObjects:title, introductionItem, interestsItem, nil]];
}

#pragma mark -UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 1000)];
    
    self.view.frame = frame;
    
    [self setupAnimationItems];
    
    return self;
}

- (id)init {
    self = [super init];
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self setupAnimationItems];
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setupAnimationItems];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setupAnimationItems];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

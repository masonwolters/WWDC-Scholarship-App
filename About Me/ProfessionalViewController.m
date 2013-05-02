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
    
    TitleAnimateItem *title = [[TitleAnimateItem alloc] initWithTitle:@"Professional"];
    
    
    HeaderAnimateItem *earlyYearsHeader = [[HeaderAnimateItem alloc] initWithTitle:@"The Early Years" yPosition:60.0f];
    
    CardView *earlyYearsCard = [[CardView alloc] initWithTitle:@"Jump Into Fun" text:@"I owned my very own business when I was only eight years old. I rented out a bouncehouse for birthday parties and other events." frame:CGRectMake(0, earlyYearsHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *earlyYearsItem = [[ScrollAnimateItem alloc] init];
    earlyYearsItem.view = earlyYearsCard;
    [earlyYearsItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    
    HeaderAnimateItem *todayHeader = [[HeaderAnimateItem alloc] initWithTitle:@"Today" yPosition:earlyYearsCard.frame.origin.y + earlyYearsCard.frame.size.height];
    
    CardView *sailingCard = [[CardView alloc] initWithTitle:@"Sailing Instructor" text:@"I am a sailing instructor" frame:CGRectMake(0, todayHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *sailingItem = [[ScrollAnimateItem alloc] init];
    sailingItem.view = sailingCard;
    [sailingItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    CardView *photographyCard = [[CardView alloc] initWithTitle:@"Photography" text:@"I take pictures" frame:CGRectMake(0, sailingItem.view.frame.origin.y + sailingItem.view.frame.size.height, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *photographyItem = [[ScrollAnimateItem alloc] init];
    photographyItem.view = photographyCard;
    [photographyItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    CardView *videographyCard = [[CardView alloc] initWithTitle:@"Videography" text:@"I advertise on youtube" frame:CGRectMake(0, photographyItem.view.frame.origin.y + photographyItem.view.frame.size.height, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *videographyItem = [[ScrollAnimateItem alloc] init];
    videographyItem.view = videographyCard;
    [videographyItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];

    
    [self setAnimateItems:[NSArray arrayWithObjects: title, earlyYearsHeader, earlyYearsItem, todayHeader, sailingItem, photographyItem, videographyItem, nil]];
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

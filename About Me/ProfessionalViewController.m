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
    
    CardView *sailingCard = [[CardView alloc] initWithTitle:@"Sailing Instructor" text:@"In the summer, I share my passion for sailing with other kids by teaching them how to sail. I am a sailing instructor at Muskegon Yacht Club in Muskegon, Michigan. I teach kids from age 4 to 15, and ocassionally adults. I also do private lessons for kids interested in racing." frame:CGRectMake(0, todayHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *sailingItem = [[ScrollAnimateItem alloc] init];
    sailingItem.view = sailingCard;
    [sailingItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    CardView *photographyCard = [[CardView alloc] initWithTitle:@"Photography" text:@"I occasionally do portraits for people. My dad is a professional photographer, so I can use all of his equipment." frame:CGRectMake(0, sailingItem.view.frame.origin.y + sailingItem.view.frame.size.height, self.view.frame.size.width, 320) automaticHeight:NO];
    ScrollAnimateItem *photographyItem = [[ScrollAnimateItem alloc] init];
    photographyItem.view = photographyCard;
    [photographyItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *alexItem = [[ImageAnimateItem alloc] initWithImageName:@"alex.png" yPosition:640.0f width:260.0f];
    [alexItem setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [alexItem addFirstKeyframeForStartScroll:300.0f finish:380.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    CardView *videographyCard = [[CardView alloc] initWithTitle:@"Videography" text:@"My youtube channel has over 200,000 views, and all my videos have advertisements on them. I make money every time someone clicks on an ad. It doesn't make me rich, but I have made some decent money from it." frame:CGRectMake(0, photographyItem.view.frame.origin.y + photographyItem.view.frame.size.height, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *videographyItem = [[ScrollAnimateItem alloc] init];
    videographyItem.view = videographyCard;
    [videographyItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [videographyItem addFirstKeyframeForStartScroll:650.0f finish:800.0f opacity:1.0f scale:1.3f point:CGPointMake(0, 110)];

    
    [self setAnimateItems:[NSArray arrayWithObjects: title, earlyYearsHeader, earlyYearsItem, todayHeader, sailingItem, photographyItem, alexItem, videographyItem, nil]];
}

#pragma mark - UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 1070 - 440  + self.view.frame.size.height - 20)];
    
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

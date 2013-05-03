//
//  TechSkillsViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/26/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "TechSkillsViewController.h"

@interface TechSkillsViewController ()

@end

@implementation TechSkillsViewController

#pragma mark - Handle Events

- (void)tapTimelapseVideo {
    [self showYoutubeVideoWithLink:@"http://www.youtube.com/watch?v=7Fqtl1q8nO0"];
}

- (void)tapTypographyVideo {
    [self showYoutubeVideoWithLink:@"http://www.youtube.com/watch?v=PWMMaq6muk0"];
}

- (void)tapTempleRunVideo {
    [self showYoutubeVideoWithLink:@"http://www.youtube.com/watch?v=y63nhCuTBAg"];
}

#pragma mark - Private Methods

- (void)setupAnimationItems {
    
    TitleAnimateItem *title = [[TitleAnimateItem alloc] initWithTitle:@"Tech Skills"];
    
    
    CardView *introView = [[CardView alloc] initWithTitle:nil text:@"Ever since I was little, I have had an intense interest in technology. Here are some of my standout skills." frame:CGRectMake(0, 60, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *introItem = [[ScrollAnimateItem alloc] init];
    introItem.view = introView;
    [introItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];

    
    HeaderAnimateItem *iosDev = [[HeaderAnimateItem alloc] initWithTitle:@"iOS Development" yPosition:introItem.view.frame.origin.y + introItem.view.frame.size.height];
    
    CardView *iosCard = [[CardView alloc] initWithTitle:nil text:@"We'll start with the obvious. I started learning Objective C about 8 months ago. I taught myself how to make iOS apps, and I am currently working on a few projects." frame:CGRectMake(0, iosDev.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *iosItem = [[ScrollAnimateItem alloc] init];
    iosItem.view = iosCard;
    [iosItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    
    HeaderAnimateItem *phpHeader = [[HeaderAnimateItem alloc] initWithTitle:@"PHP/MySQL" yPosition:iosItem.view.frame.origin.y + iosItem.view.frame.size.height];

    CardView *phpCard = [[CardView alloc] initWithTitle:nil text:@"I just recently started learning PHP, but I am coming along quickly because of the similarity to C. I wanted to incorporate cloud functionality into my apps, so I started experimenting. I now have a fully functional cloud storage platform for my Sailing Score Keeper app." frame:CGRectMake(0, phpHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *phpItem = [[ScrollAnimateItem alloc] init];
    phpItem.view = phpCard;
    [phpItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    

    HeaderAnimateItem *roboticsHeader = [[HeaderAnimateItem alloc] initWithTitle:@"Robotics" yPosition:phpItem.view.frame.origin.y + phpItem.view.frame.size.height];
    
    CardView *arduinoCard = [[CardView alloc] initWithTitle:@"Arduino" text:@"I got an Arduino kit for Christmas, and I quickly started interfacing hardware with software. It was exciting to interface software with the physical world. The second day I had it, I built a pan/tilt system for my GoPro camera. Then I wrote an iOS app that connects to the Arduino over bluetooth and controls the position of the camera in relation to the gyroscope in the iOS device. I wish I had a video of it working, but I took it apart soon after." frame:CGRectMake(0, roboticsHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *arduinoItem = [[ScrollAnimateItem alloc] init];
    arduinoItem.view = arduinoCard;
    [arduinoItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    CardView *timelapseCard = [[CardView alloc] initWithTitle:@"Motion Timelapse" text:@"I combined my skill with robotics with my interest in photography. I built a track and dolly system for the camera to slide on and motorized it using the Lego NXT. I wrote a program that allowed you to set a time and distance interval that it would move in between each shot. When you then combined the pictures from the timelapse together it had the appearance of moving smoothly. You can buy motion dolly systems that perform the same function, but they are well upward of $2,000." frame:CGRectMake(0, arduinoCard.frame.origin.y + arduinoCard.frame.size.height, self.view.frame.size.width, 600) automaticHeight:NO];
    ScrollAnimateItem *timelapseItem = [[ScrollAnimateItem alloc] init];
    timelapseItem.view = timelapseCard;
    [timelapseItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *timelapseImage = [[ImageAnimateItem alloc] initWithImageName:@"timelapse_rig.png" yPosition:1240.0f width:260.0f];
    [timelapseImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [timelapseImage addFirstKeyframeForStartScroll:920.0f finish:1000.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *timelapseVideo = [[ImageAnimateItem alloc] initWithImageName:@"Timelapse_Youtube.png" yPosition:1340.0f width:260.0f];
    [timelapseVideo setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [timelapseVideo addFirstKeyframeForStartScroll:1090.0f finish:1170.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [timelapseVideo addGestureRecognizerForTimelapseVideo];
    timelapseVideo.delegate = self;
    
    
    HeaderAnimateItem *videoHeader = [[HeaderAnimateItem alloc] initWithTitle:@"Video Editing" yPosition:timelapseImage.view.frame.origin.y + timelapseImage.view.frame.size.height];

    CardView *videoCard = [[CardView alloc] initWithTitle:nil text:@"Before I got into iOS development, I spent a lot of my time learning After Effects. I got pretty good, and I could do some pretty cool things with video. This will no doubt come in handy someday when I have to make a promotional video for an app." frame:CGRectMake(0, videoHeader.yPosition + 50, self.view.frame.size.width, 510) automaticHeight:NO];
    ScrollAnimateItem *videoItem = [[ScrollAnimateItem alloc] init];
    videoItem.view = videoCard;
    [videoItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [videoItem addFirstKeyframeForStartScroll:1692 finish:1692+150 opacity:1.0f scale:1.3f point:CGPointMake(0, 110)];

    ImageAnimateItem *typographyImage = [[ImageAnimateItem alloc] initWithImageName:@"Typography_Youtube.png" yPosition:1730.0f width:260.0f];
    [typographyImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [typographyImage addFirstKeyframeForStartScroll:1420.0f finish:1500.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [typographyImage addGestureRecognizerForTypographyVideo];
    typographyImage.delegate = self;

    ImageAnimateItem *templeRunImage = [[ImageAnimateItem alloc] initWithImageName:@"temple_run_youtube.png" yPosition:1900.0f width:260.0f];
    [templeRunImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [templeRunImage addFirstKeyframeForStartScroll:1560.0f finish:1640.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [templeRunImage addSecondKeyframeForStartScroll:1692 finish:1692+150 opacity:1.0f scale:1.3f point:CGPointMake(0, 110)];
    [templeRunImage addGestureRecognizerForTempleRunVideo];
    templeRunImage.delegate = self;
    
    
    [self setAnimateItems:[NSArray arrayWithObjects: introItem, title, iosDev, iosItem, phpHeader, phpItem, roboticsHeader, arduinoItem, timelapseItem, timelapseImage, timelapseVideo, videoHeader, videoItem, typographyImage, templeRunImage, nil]];
}

#pragma mark - ViewController Methods

- (id)initWithFrame:(CGRect)frame {
    NSLog(@"frame: %f, %f", frame.size.width, frame.size.height);
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 1668 + self.view.frame.size.height - 20)];
    
    self.view.frame = frame;
    
    [self setupAnimationItems];
    self.view.backgroundColor = UIColorFromRGB(backgroundColorHEX);
    
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

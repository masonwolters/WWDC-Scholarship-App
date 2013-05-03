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

#pragma mark - Handle Events

- (void)tapSailingVideo {
    [self showYoutubeVideoWithLink:@"http://www.youtube.com/watch?v=5PJfPOesipQ"];
}

- (void)tapWhirlygigVideo {
    NSLog(@"tap whirly");
    NSURL *myURL = [[NSBundle mainBundle] URLForResource:@"Whirlygig_small" withExtension:@"m4v"];
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL: myURL];
    [self presentMoviePlayerViewControllerAnimated:player];
    //[self showYoutubeVideoWithLink:@"http://www.youtube.com/watch?v=40viX5upSJI"];
}

#pragma mark - Private Methods

- (void)setupAnimationItems {
    
    TitleAnimateItem *title = [[TitleAnimateItem alloc] initWithTitle:@"About Me"];
    
    UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake(280, self.view.frame.size.height - 30, 30, 30)];
    arrow.layer.zPosition = 1.2f;
    arrow.image = [UIImage imageNamed:@"arrow.png"];
    ScrollAnimateItem *arrowItem = [[ScrollAnimateItem alloc] init];
    arrowItem.view = arrow;
    [arrowItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [arrowItem addFirstKeyframeForStartScroll:0.0f finish:20.0f opacity:0.0f scale:1.3f point:CGPointMake(0, 0)];
    
    CardView *intro = [[CardView alloc] initWithTitle:nil text:@"My name is Mason Wolters, and I'm an eleventh grade student at Spring Lake High School in Spring Lake, Michigan." frame:CGRectMake(0, 60, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *introItem = [[ScrollAnimateItem alloc] init];
    introItem.view = intro;
    [introItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    
    HeaderAnimateItem *interestsHeader = [[HeaderAnimateItem alloc] initWithTitle:@"My Interests" yPosition:160.0f];
    
    
    CardView *sailingCard = [[CardView alloc] initWithTitle:@"Sailing" text:@"I've been sailing for over five years. I sail on my school's sailing team and in the summer on my own boat. I have won multiple regattas, and I have a shelf full of trophies" frame:CGRectMake(0, interestsHeader.yPosition + 50, self.view.frame.size.width, 740) automaticHeight:NO];
    ScrollAnimateItem *sailingItem = [[ScrollAnimateItem alloc] init];
    sailingItem.view = sailingCard;
    [sailingItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    float startSailingImage = 380.0f;
    ImageAnimateItem *sailingImage = [[ImageAnimateItem alloc] initWithImageName:@"sailing.jpg" yPosition:startSailingImage width:260.0f];
    [sailingImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [sailingImage addFirstKeyframeForStartScroll:0.0f finish:80.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];

    ImageAnimateItem *secondSailingImage = [[ImageAnimateItem alloc] initWithImageName:@"butterfly.png" yPosition:sailingImage.yPosition + 40 width:260.0f];
    [secondSailingImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [secondSailingImage addFirstKeyframeForStartScroll:300.0f finish:380.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *thirdSailingImage = [[ImageAnimateItem alloc] initWithImageName:@"420trapeze.png" yPosition:secondSailingImage.yPosition + 250 width:260.0f];
    [thirdSailingImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [thirdSailingImage addFirstKeyframeForStartScroll:400.0f finish:480.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [thirdSailingImage addSecondKeyframeForStartScroll:788 finish:789 opacity:0.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *fourthSailingImage = [[ImageAnimateItem alloc] initWithImageName:@"laser_sailing.png" yPosition:thirdSailingImage.yPosition + 50 width:260.0f];
    [fourthSailingImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [fourthSailingImage addFirstKeyframeForStartScroll:530.0f finish:610.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [fourthSailingImage addSecondKeyframeForStartScroll:788 finish:789 opacity:0.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *youtubeSailingImage = [[ImageAnimateItem alloc] initWithImageName:@"420HeavyWind_Youtube.png" yPosition:fourthSailingImage.yPosition + 50 width:260.0f];
    [youtubeSailingImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [youtubeSailingImage addFirstKeyframeForStartScroll:600.0f finish:680.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [youtubeSailingImage addSecondKeyframeForStartScroll:790.0f finish:920.0f opacity:0.0f scale:1.3f point:CGPointMake(0, -50)];
    [youtubeSailingImage addGestureRecognizerForSailingVideo];
    youtubeSailingImage.delegate = self;
    
    CardView *skiingCard = [[CardView alloc] initWithTitle:@"Skiing" text:@"When it's too cold to sail, I ski instead. I am on my school's ski club and I go out to Colorado every year. My favorite resort is Breckenridge." frame:CGRectMake(0, sailingCard.frame.origin.y + sailingCard.frame.size.height, self.view.frame.size.width, 800.0f) automaticHeight:NO];
    ScrollAnimateItem *skiingItem = [[ScrollAnimateItem alloc] init];
    skiingItem.view = skiingCard;
    [skiingItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *skiing1 = [[ImageAnimateItem alloc] initWithImageName:@"skiing_bowl.png" yPosition:1100.0f width:260.0f];
    [skiing1 setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [skiing1 addFirstKeyframeForStartScroll:770.0f finish:850.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *skiing2 = [[ImageAnimateItem alloc] initWithImageName:@"summit.png" yPosition:skiing1.yPosition + 220 width:260.0f];
    [skiing2 setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [skiing2 addFirstKeyframeForStartScroll:1000.0f finish:1080.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *skiing3 = [[ImageAnimateItem alloc] initWithImageName:@"skiing_powder@2x.png" yPosition:skiing2.yPosition + 50 width:260.0f];
    [skiing3 setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [skiing3 addFirstKeyframeForStartScroll:1200.0f finish:1280.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *whirlygigYoutube = [[ImageAnimateItem alloc] initWithImageName:@"Whirlygig_Youtube.png" yPosition:skiing3.yPosition + 200 width:260.0f];
    [whirlygigYoutube setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [whirlygigYoutube addFirstKeyframeForStartScroll:1330.0f finish:1410.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [whirlygigYoutube addGestureRecognizerForWhirlygigVideo];
    whirlygigYoutube.delegate = self;
    
    
    CardView *moreView = [[CardView alloc] initWithTitle:nil text:@"Go ahead and learn more about me by tapping the circle at the top." frame:CGRectMake(0, skiingCard.frame.origin.y + skiingCard.frame.size.height, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *moreItem = [[ScrollAnimateItem alloc] init];
    moreItem.view = moreView;
    [moreItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [moreItem addFirstKeyframeForStartScroll:1424 finish:1424+150 opacity:1.0f scale:1.3f point:CGPointMake(0, 140)];
    
    [self setAnimateItems:[NSArray arrayWithObjects: title, introItem, interestsHeader, sailingItem, sailingImage, secondSailingImage, thirdSailingImage, fourthSailingImage, youtubeSailingImage, skiingItem, skiing1, skiing2, skiing3, whirlygigYoutube, moreItem, arrowItem, nil]];
}



#pragma mark -UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 1380+self.view.frame.size.height)];
    
    self.view.frame = frame;
    
    [self setupAnimationItems];
    
    return self;
}

- (id)init {
    self = [super init];
    
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
    
    self.view.backgroundColor = UIColorFromRGB(backgroundColorHEX);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

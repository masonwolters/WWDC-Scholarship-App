//
//  ProjectsViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/26/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ProjectsViewController.h"

@interface ProjectsViewController ()

@end

@implementation ProjectsViewController

#pragma mark - Private Methods

- (void)setupAnimationItems {
    
    TitleAnimateItem *title = [[TitleAnimateItem alloc] initWithTitle:@"Projects"];
    
    
    HeaderAnimateItem *pastHeader = [[HeaderAnimateItem alloc] initWithTitle:@"Past Projects" yPosition:60.0f];
    
    CardView *phpCard = [[CardView alloc] initWithTitle:@"Fabric Database" text:@"This was one of the first PHP projects I did. I designed a MySQL database to hold different fabrics for chairs. I then wrote some PHP to read the database and display the images and names of the different fabrics. You can also sort by manufacturer. It gave the client an easy and efficient way to add new fabrics in the future." frame:CGRectMake(0, pastHeader.yPosition + 50, self.view.frame.size.width, 510) automaticHeight:NO];
    ScrollAnimateItem *phpItem = [[ScrollAnimateItem alloc] init];
    phpItem.view = phpCard;
    [phpItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *databaseImage = [[ImageAnimateItem alloc] initWithImageName:@"fabric_database" yPosition: 340.0f width:260.0f];
    [databaseImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [databaseImage addFirstKeyframeForStartScroll:0.0f finish:80.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [databaseImage addSecondKeyframeForStartScroll:450.0f finish:600.0f opacity:0.0f scale:1.3f point:CGPointMake(0, -30)];
    
    
    HeaderAnimateItem *currentHeader = [[HeaderAnimateItem alloc] initWithTitle:@"Current Projects" yPosition:phpCard.frame.origin.y + phpCard.frame.size.height];
    
    CardView *scorerCard = [[CardView alloc] initWithTitle:@"Sailing Score Keeper" text:@"I originally started this project last summer to give me an app to learn new skills from writing. It was intended to be a dead simple app for scoring sailboat races, but it has turned into something much, much more complex. I have been working on it for the better part of eight months, and it has gone through many different looks. I wanted it to sync with the cloud, so I learned PHP and MySQL. It now stores all of your regattas that you have scored in the cloud, and they can be viewed on the internet. I am almost done with this project, and I am hoping to release it on the app store in the next couple of months." frame:CGRectMake(0, currentHeader.yPosition + 50, self.view.frame.size.width, 895) automaticHeight:NO];
    ScrollAnimateItem *scorerItem = [[ScrollAnimateItem alloc] init];
    scorerItem.view = scorerCard;
    [scorerItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *firstScreen = [[ImageAnimateItem alloc] initWithImageName:@"iScore2.png" yPosition:1030.0f width:260.0f];
    [firstScreen setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [firstScreen addFirstKeyframeForStartScroll:700.0f finish:780.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *secondScreen = [[ImageAnimateItem alloc] initWithImageName:@"iScore1.png" yPosition:1150.0f width:260.0f];
    [secondScreen setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(-320, 0)];
    [secondScreen addFirstKeyframeForStartScroll:1000.0f finish:1080.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [secondScreen addSecondKeyframeForStartScroll:1425.0f finish:1540.0f opacity:0.0f scale:1.3f point:CGPointMake(0, -60)];
    
    CardView *anarchyCard = [[CardView alloc] initWithTitle:@"Sailing Anarchy" text:@"Being a sailor, I often visit the blog \"Sailing Anarchy\". It's not very well done, but it's the most popular sailing blog. They don't have an iPhone app, so I decided to make one. The first challenge was the size of the images. They don't downscale images to display on the site, which is one of the reasons that the site's load time is very long. I used my newfound knowledge of PHP and MySQL to write a PHP script that grabs the images, downsizes them, and stores them in a database. My Sailing Anarchy app fetches the content from my server through some PHP scripts, so the load time is a ton faster. This was a great exercise in PHP and MySql, and I'm not sure about my plans for its future at the moment." frame:CGRectMake(0, scorerCard.frame.origin.y + scorerCard.frame.size.height, self.view.frame.size.width, 830) automaticHeight:NO];
    ScrollAnimateItem *anarchyItem = [[ScrollAnimateItem alloc] init];
    anarchyItem.view = anarchyCard;
    [anarchyItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    ImageAnimateItem *anarchyImage = [[ImageAnimateItem alloc] initWithImageName:@"SA_screen_shot.png" yPosition:1980.0f width:260.0f];
    [anarchyImage setStartingValuesOpacity:0.0f scale:.5f point:CGPointMake(320, 0)];
    [anarchyImage addFirstKeyframeForStartScroll:1660.0f finish:1740.0f opacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [anarchyImage addSecondKeyframeForStartScroll:2240.0f finish:2370.0f opacity:0.0f scale:1.3f point:CGPointMake(0, -65)];
    
    
    HeaderAnimateItem *futureHeader = [[HeaderAnimateItem alloc] initWithTitle:@"Future Projects" yPosition:anarchyCard.frame.origin.y + anarchyCard.frame.size.height];
    
    CardView *futureCard = [[CardView alloc] initWithTitle:@"Advertising App" text:@"I have an awesome idea for an app that would serve as the link between advertisers and consumers. It's in the theoretical stage right now, but I'm going to pursue it in the near future." frame:CGRectMake(0, futureHeader.yPosition + 50, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *futureItem = [[ScrollAnimateItem alloc] init];
    futureItem.view = futureCard;
    [futureItem setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    
    CardView *future2Card = [[CardView alloc] initWithTitle:@"This App" text:@"I think I have a solid foundation for this app, but it can definitely be improved. My plan is to keep working on it even after I submit it. One week was very little time to work on it, and I think I can do some pretty cool things when I have more time." frame:CGRectMake(0, futureCard.frame.origin.y + futureCard.frame.size.height, self.view.frame.size.width, 100) automaticHeight:YES];
    ScrollAnimateItem *future2Item = [[ScrollAnimateItem alloc] init];
    future2Item.view = future2Card;
    [future2Item setStartingValuesOpacity:1.0f scale:1.0f point:CGPointMake(0, 0)];
    [future2Item addFirstKeyframeForStartScroll:2414 finish:2414+150 opacity:1.0f scale:1.3f point:CGPointMake(0, 110)];
    
    
    [self setAnimateItems:[NSArray arrayWithObjects: title, pastHeader, phpItem, databaseImage, currentHeader, scorerItem, firstScreen, secondScreen, anarchyItem, anarchyImage, futureHeader, futureItem, future2Item, nil]];
}

#pragma mark - UIViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 2390 + self.view.frame.size.height - 20)];
    
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

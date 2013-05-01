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



#pragma mark - Private Methods

- (void)setupAnimationItems {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20*i, 150, 15, 15)];
        view.backgroundColor = [UIColor orangeColor];
        
        ScrollAnimateItem *item = [[ScrollAnimateItem alloc] init];
        item.view = view;
        [item setStartingValuesOpacity:0.0f scale:1.0f point:CGPointMake(0, 0)];
        [item addFirstKeyframeForStartScroll:i * 5.0f finish:i * 5 + 50.0f opacity:1.0f scale:5.0f point:CGPointMake(0, 100.0f)];
        //[item addSecondKeyframeForStartScroll:50.0f finish:100.0f opacity:.5f scale:1.0f point:CGPointMake(0, 100)];
        
        [array addObject:item];
    }
    
[self setAnimateItems:[NSArray arrayWithArray:array]];
}

#pragma mark - ViewController Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame scrollViewContentSize:CGSizeMake(frame.size.width, 1000)];
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    
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

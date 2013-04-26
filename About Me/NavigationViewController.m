//
//  NavigationViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/25/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

@synthesize contentView;

#pragma mark - ButtonNavigation Delegate

- (void)didSelectButtonWithIndex:(int)index {

    if (index == indexOfTechSkills) {
        TechSkillsViewController *techController = [[TechSkillsViewController alloc] initWithFrame:[self getFrameOfViewControllers]];
        [self displayViewControllerAnimated:techController];
    } else if (index == indexOfEducation) {
        EducationViewController *educationController = [[EducationViewController alloc] initWithFrame:[self getFrameOfViewControllers]];
        [self displayViewControllerAnimated:educationController];
    } else if (index == indexOfProfessional) {
        ProfessionalViewController *professionalController = [[ProfessionalViewController alloc] initWithFrame:[self getFrameOfViewControllers]];
        [self displayViewControllerAnimated:professionalController];
    } else if (index == indexOfProjects) {
        ProjectsViewController *projectsController = [[ProjectsViewController alloc] initWithFrame:[self getFrameOfViewControllers]];
        [self displayViewControllerAnimated:projectsController];
    } else if (index == indexOfFuture) {
        FutureViewController *futureController = [[FutureViewController alloc] initWithFrame:[self getFrameOfViewControllers]];
        [self displayViewControllerAnimated:futureController];
    }
}

#pragma mark - Private Methods

- (void)displayViewControllerAnimated:(UIViewController*)viewController {
    viewController.view.alpha = 0.0f;
    viewController.view.transform = CGAffineTransformMakeScale(.75, .75);
    [self.contentView addSubview:viewController.view];
    
    [UIView animateWithDuration:.2 animations:^{
        viewController.view.alpha = 1.0f;
        viewController.view.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        [self setViewControllers:[NSArray arrayWithObject:viewController]];
        [[self.contentView.subviews lastObject] removeFromSuperview];
    }];
}

- (CGRect)getFrameOfViewControllers {
    return CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
}

#pragma mark - UIViewController Methods

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
    
    contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:contentView];
    
    NSLog(@"frame height: %f y: %f", self.view.frame.size.height, self.view.frame.origin.y);
    //ButtonNavigationView *buttonNav = [[ButtonNavigationView alloc] initWithFrame:CGRectMake(0, -1 * self.view.frame.size.height/2 + heightOfButton/2/2 + 20, self.view.frame.size.width, self.view.frame.size.height)];
    ButtonNavigationView *buttonNav = [[ButtonNavigationView alloc] initWithFrame:self.view.bounds];
    buttonNav.delegate = self;
    //buttonNav.center = CGPointMake(self.view.center.x, 22 +20);
    buttonNav.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(scaleAmount, scaleAmount), CGAffineTransformMakeTranslation(0, -1 * self.view.frame.size.height/2 + heightOfButton/2/2 + 20));
    //buttonNav.transform = CGAffineTransformMakeScale(.5, .5);
    [self.view addSubview:buttonNav];
    

    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

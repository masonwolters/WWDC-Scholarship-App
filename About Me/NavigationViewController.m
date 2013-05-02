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
@synthesize dimmingView;

#pragma mark - ButtonNavigation Delegate

- (void)didSelectButtonWithIndex:(int)index {

    if (index == indexOfAboutMe) {
        AboutMeViewController *aboutMeController = [[AboutMeViewController alloc] initWithFrame:[self getFrameOfViewControllers]];
        [self displayViewControllerAnimated:aboutMeController];
    }
    
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

- (void)shouldDim {
    [self.view insertSubview:dimmingView belowSubview:buttonNavView];
    [UIView animateWithDuration:.2f animations:^{
        dimmingView.alpha = .5f;
    }];
//    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 480 - 44)];
//    image.image = [UIImage imageNamed:@"sailing.jpg"];
//    [self.contentView addSubview:image];
//    
//    CABasicAnimation* blurAnimation = [CABasicAnimation animation];
//    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
//    [blurFilter setDefaults];
//    [blurFilter setValue:[NSNumber numberWithFloat:10.0] forKey:@"inputRadius"];
//    //[blurFilter setName:@"blur"];
//    [image.layer setFilters:[NSArray arrayWithObject:blurFilter]];
//    
//    blurAnimation.keyPath = @"filters.blur.inputRadius";
//    blurAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    blurAnimation.toValue = [NSNumber numberWithFloat:10.0f];
//    blurAnimation.duration = .2;
    
}

- (void)shouldUnDim {
    [UIView animateWithDuration:.2f animations:^{
        dimmingView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [dimmingView removeFromSuperview];
    }];
}

#pragma mark - Private Methods

- (void)displayViewControllerAnimated:(UIViewController*)viewController {
    [self.view insertSubview:contentView belowSubview:buttonNavView];
    viewController.view.alpha = 0.0f;

    viewController.view.transform = CGAffineTransformMakeScale(.75, .75);
    [self.contentView addSubview:viewController.view];
    
//    CATransform3D scale = CATransform3DMakeScale(.9, .9, .9);
//    id toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
//    viewController.view.layer.transform = scale;
//    SKBounceAnimation *scaleBounce = [SKBounceAnimation animationWithKeyPath:@"transform"];
//    scaleBounce.fromValue = [NSValue valueWithCATransform3D:viewController.view.layer.transform];
//    scaleBounce.toValue = toValue;
//    scaleBounce.duration = .2f;
//    scaleBounce.numberOfBounces = 2;
//    scaleBounce.shouldOvershoot = YES;
//    
//    [viewController.view.layer addAnimation:scaleBounce forKey:@"key"];
//    
//    viewController.view.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
    
    
    [UIView animateWithDuration:.2 animations:^{
        viewController.view.alpha = 1.0f;
        viewController.view.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        [self setViewControllers:[NSArray arrayWithObject:viewController]];
        [[self.contentView.subviews lastObject] removeFromSuperview];
        [self.contentView removeFromSuperview];
    }];
    
    
    
}

- (CGRect)getFrameOfViewControllers {
    return CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
}

-(void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
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
    //[self.view addSubview:contentView];
    
    dimmingView = [[UIView alloc] initWithFrame:self.view.bounds];
    dimmingView.backgroundColor = [UIColor blackColor];
    dimmingView.alpha = 0.0f;
    //[self.view addSubview:dimmingView];
    
    NSLog(@"frame height: %f y: %f", self.view.frame.size.height, self.view.frame.origin.y);
    //ButtonNavigationView *buttonNav = [[ButtonNavigationView alloc] initWithFrame:CGRectMake(0, -1 * self.view.frame.size.height/2 + heightOfButton/2/2 + 20, self.view.frame.size.width, self.view.frame.size.height)];
    buttonNavView = [[ButtonNavigationView alloc] initWithFrame:self.view.bounds];
    buttonNavView.delegate = self;
    [self setAnchorPoint:CGPointMake(.5, 1) forView:buttonNavView];
    buttonNavView.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(scaleAmount, scaleAmount), CGAffineTransformMakeTranslation(0, -1 * self.view.frame.size.height + heightOfButton/2 + 20));
    
    [self.view addSubview:buttonNavView];
    
    AboutMeViewController *aboutMe = [[AboutMeViewController alloc] initWithFrame:[self getFrameOfViewControllers]];
    [self displayViewControllerAnimated:aboutMe];
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

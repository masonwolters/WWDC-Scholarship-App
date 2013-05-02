//
//  WebVideoViewController.m
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "WebVideoViewController.h"

@interface WebVideoViewController ()

@end

@implementation WebVideoViewController

- (void)donePress {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithYoutubeURL:(NSString *)string frame:(CGRect)frame {
    self = [super init];
    
    self.view.frame = frame;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePress)];
    done.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = done;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:string]]];
    [self.view addSubview:webView];
    
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

- (BOOL)shouldAutorotate {
    return NO;
}

@end

//
//  AppDelegate.m
//  About Me
//
//  Created by Mason Wolters on 4/24/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//
//    ViewController *root = [[ViewController alloc] init];
//    self.window.rootViewController = root;
//    
//    ButtonNavigationView *buttonView = [[ButtonNavigationView alloc] initWithFrame:self.window.bounds];
//    [self.window addSubview:buttonView];
//    [self.window makeKeyAndVisible];
    
    [[UINavigationBar appearance] setBackgroundImage:[self drawImageForNavBar] forBarMetrics:UIBarMetricsDefault];



    
    return YES;
}

- (UIImage*)drawImageForNavBar {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(320, 44), NO, 0);
    UIColor *colorFlat = UIColorFromRGB(0x3e454c);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [colorFlat CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 320, 44));
    
    
    UIImage *texture = [UIImage imageNamed:@"noise_texture.png"];
    [texture drawAtPoint:CGPointMake(0, 0) blendMode:kCGBlendModeOverlay alpha:.5f];
    
    
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

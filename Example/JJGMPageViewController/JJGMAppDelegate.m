//
//  JJGMAppDelegate.m
//  JJGMPageViewController
//
//  Created by juanjoguevara on 05/07/2017.
//  Copyright (c) 2017 juanjoguevara. All rights reserved.
//

#import "JJGMAppDelegate.h"
#import "JJGMPageViewController.h"
#import "JJGMViewController.h"
@implementation JJGMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    JJGMViewController *firstViewController = [[JJGMViewController alloc] initWithNibName:@"JJGMViewController" bundle:nil];
    JJGMViewController *secondViewController =[[JJGMViewController alloc] initWithNibName:@"JJGMViewController" bundle:nil];
    JJGMViewController *thirdViewController = [[JJGMViewController alloc] initWithNibName:@"JJGMViewController" bundle:nil];
    
   
    

    
    JJGMPageViewController *pageViewController = [[JJGMPageViewController alloc] init];
    
    pageViewController.delegate = self;
    [pageViewController addViewControllers:@[firstViewController,secondViewController,thirdViewController]];
    
   
    
    firstViewController.imageView.image = [UIImage imageNamed:@"1"];
    secondViewController.imageView.image = [UIImage imageNamed:@"2"];
    thirdViewController.imageView.image = [UIImage imageNamed:@"3"];
 
    firstViewController.title = @"First view";
    secondViewController.title = @"Second view";
    thirdViewController.title = @"Third view";

    UIBarButtonItem *backItem =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:pageViewController action:@selector(back)];
    
    UIBarButtonItem *nextItem =[[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:pageViewController action:@selector(next)];
    
    pageViewController.navigationItem.leftBarButtonItem = backItem;
    pageViewController.navigationItem.rightBarButtonItem = nextItem;
    // Override point for customization after application launch.
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pageViewController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
     [pageViewController moveToViewController:secondViewController animated:NO];
    self.pageViewController.title =@"1";
    return YES;
}

-(void)pageViewController:(JJGMPageViewController*)pageController didChangeToViewController:(UIViewController*)viewController{
    
    pageController.title = viewController.title;
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

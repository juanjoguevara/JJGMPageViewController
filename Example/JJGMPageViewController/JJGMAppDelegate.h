//
//  JJGMAppDelegate.h
//  JJGMPageViewController
//
//  Created by juanjoguevara on 05/07/2017.
//  Copyright (c) 2017 juanjoguevara. All rights reserved.
//

@import UIKit;
#import "JJGMPageViewController.h"

@interface JJGMAppDelegate : UIResponder <UIApplicationDelegate, JJPageViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)  JJGMPageViewController *pageViewController;

@end

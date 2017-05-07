//
//  JJGMPageViewController.m
//  PageViewController Objective C
//
//  Created by Juanjo Guevara.
//

#import <UIKit/UIKit.h>

@interface JJGMPageViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (readwrite, nonatomic) BOOL bounces;

-(void)addViewControllers:(NSArray*)array;

-(void)goPrevious:(BOOL)animated;
-(void)goNext:(BOOL)animated;
-(void)goFirst:(BOOL)animated;
-(void)goLast:(BOOL)animated;
-(void)moveToViewController:(UIViewController*)viewController animated:(BOOL)animated;
@end

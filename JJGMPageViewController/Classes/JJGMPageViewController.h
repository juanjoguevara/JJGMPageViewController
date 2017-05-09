//
//  JJGMPageViewController.m
//  PageViewController Objective C
//
//  Created by Juanjo Guevara.
//

#import <UIKit/UIKit.h>




@interface JJGMPageViewController : UIViewController 

@property (strong, nonatomic) UIPageControl *pageControl;
@property (weak, nonatomic) id  delegate;

-(void)addViewControllers:(NSArray*)array;

-(void)back;
-(void)next;
-(void)first;
-(void)last;
-(void)back:(BOOL)animated;
-(void)next:(BOOL)animated;
-(void)first:(BOOL)animated;
-(void)last:(BOOL)animated;
-(void)moveToViewController:(UIViewController*)viewController animated:(BOOL)animated;
@end
@protocol JJPageViewControllerDelegate <NSObject>

-(void)pageViewController:(JJGMPageViewController*)pageController didChangeToViewController:(UIViewController*)viewController;
@end

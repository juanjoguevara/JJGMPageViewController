//
//  JJGMPageViewController.m
//  PageViewController Objective C
//
//  Created by Juanjo Guevara.
//

#import <UIKit/UIKit.h>

@interface JJGMPageViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

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

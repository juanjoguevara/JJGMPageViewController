//
//  JJGMPageViewController.m
//  PageViewController Objective C
//
//  Created by Juanjo Guevara.
//

#import "JJGMPageViewController.h"

@interface JJGMPageViewController () <UIPageViewControllerDelegate,UIScrollViewDelegate,UIPageViewControllerDataSource>{
    
    NSUInteger currentIndex;
    
}

@property (strong, nonatomic) UIPageViewController *pageController;
@property (weak, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *viewControllers;

@end

@implementation JJGMPageViewController


-(id)init{
    
    NSBundle *bundle = [NSBundle bundleForClass:JJGMPageViewController.class];
    
    self = [super init];

    if (self) {
      
    }
    
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.pageControl =[[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, 30)];
    
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    self.pageControl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pageControl];

    self.pageControl.transform=CGAffineTransformMakeScale(0.7, 0.7);
    self.pageControl.pageIndicatorTintColor=[[UIColor whiteColor] colorWithAlphaComponent:0.5];
    self.pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
    
    self.pageControl.isAccessibilityElement=NO;
    
    [self prefersStatusBarHidden];
    [self preferredStatusBarStyle];
    [self setNeedsStatusBarAppearanceUpdate];
    
    for (UIView *view in self.pageController.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {

            self.scrollView = (UIScrollView*)view;
            self.scrollView.delegate = self;
            break;
        }
    }
    

    self.pageControl.numberOfPages = self.viewControllers.count;
    self.pageControl.currentPage = currentIndex;
 
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Setup Methods

-(void)addViewControllers:(NSArray*)array{
   

    self.viewControllers = array;
    
    for (int i = 0; i<self.viewControllers.count; i++) {
        
        UIViewController *currentViewC = [self.viewControllers objectAtIndex:i];
        
        currentViewC.view.tag = i ;
        
    }
    
    currentIndex = 0;
    
    if (!self.pageController) {
        
        self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        
        self.pageController.dataSource = self;
        self.pageController.delegate =self;

    }
    
    [self first:NO];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
    [[self.pageController view] setFrame:[UIScreen mainScreen].bounds];
    [self.view bringSubviewToFront:self.pageControl];
    
}
    
- (void)back{
    [self back:YES];
}
- (void)next{
    [self next:YES];
}
    
- (void)first{
    [self back:YES];
}
-(void)last{
    [self next:YES];
}
-(void)back:(BOOL)animated{
    
    UIViewController *destinationViewController = [self viewControllerAtIndex:currentIndex-1];
    
    [self move:destinationViewController animated:animated];
   
}

-(void)next:(BOOL)animated{
    
    UIViewController *destinationViewController = [self viewControllerAtIndex:currentIndex+1];
    [self move:destinationViewController animated:animated];
    
}
-(void)first:(BOOL)animated{
    
    UIViewController *destinationViewController = [self viewControllerAtIndex:0];
    [self move:destinationViewController animated:animated];
    
}

-(void)last:(BOOL)animated{
    UIViewController *destinationViewController = [self viewControllerAtIndex:self.viewControllers.count-1];
    [self move:destinationViewController animated:animated];

}

-(void)moveToViewController:(UIViewController*)viewController animated:(BOOL)animated{
    
    [self move:viewController animated:animated];
    
}

-(void)move:(UIViewController*)viewController animated:(BOOL)animated{
    
    NSInteger viewIndex = [self.viewControllers indexOfObject:viewController];
                           
    if (viewController != nil && viewIndex != NSNotFound) {
        __weak typeof(self) weakSelf = self;
        BOOL reverse;
        
        if (viewIndex<currentIndex) {
            reverse = YES;
        }else{
            reverse = NO;
        }
        
        [self.pageController setViewControllers:@[viewController] direction:reverse animated:animated completion:^(BOOL finished){
            [weakSelf updateCurrentView];
            if ([weakSelf.delegate respondsToSelector:@selector(pageViewController:didChangeToViewController:)]) {
                UIViewController *currentView = [weakSelf.pageController.viewControllers objectAtIndex:0];
                [weakSelf.delegate performSelector:@selector(pageViewController:didChangeToViewController:) withObject:weakSelf withObject:currentView];
            }
        }];
    }
    
}

#pragma mark Accesories Methods

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    
    if (index < NSIntegerMax && index<self.viewControllers.count) {
        return [self.viewControllers objectAtIndex:index];
    }
  return  nil;

}


#pragma mark - UIPageViewController DataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
   
    NSUInteger index = [viewController view].tag;
    
    index --;
    
    return [self viewControllerAtIndex:index];

    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    

    NSUInteger index =[viewController view].tag;
    
    index ++;
    
    if (index == self.viewControllers.count) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

#pragma mark - UIPageViewController Delegate


-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    [self updateCurrentView];
    
    if ([self.delegate respondsToSelector:@selector(pageViewController:didChangeToViewController:)]) {
        UIViewController *currentView = [self.pageController.viewControllers objectAtIndex:0];
        [self.delegate performSelector:@selector(pageViewController:didChangeToViewController:) withObject:self withObject:currentView];
    }
}

-(void)updateCurrentView{
    UIViewController *currentView = [self.pageController.viewControllers lastObject];
    currentIndex =  currentView.view.tag;
    self.pageControl.currentPage=currentIndex;
    
    [self prefersStatusBarHidden];
    [self preferredStatusBarStyle];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self setNeedsStatusBarAppearanceUpdate];
    }];
}

#pragma mark - UIStatusBar Methods

-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    
    UIViewController *currentView = [self.pageController.viewControllers objectAtIndex:0];
    
    if ([currentView isKindOfClass:[UINavigationController class]]) {
        currentView = ((UINavigationController*) currentView).viewControllers.firstObject;
    }
    return [currentView preferredStatusBarUpdateAnimation];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    
    UIViewController *currentView = [self.pageController.viewControllers objectAtIndex:0];
    
    if ([currentView isKindOfClass:[UINavigationController class]]) {
        currentView = ((UINavigationController*) currentView).viewControllers.firstObject;
    }
    return [currentView preferredStatusBarStyle];
}
-(BOOL)prefersStatusBarHidden{
    
    UIViewController *currentView =[self.pageController.viewControllers objectAtIndex:0];
    
    if ([currentView isKindOfClass:[UINavigationController class]]) {
        currentView = ((UINavigationController*) currentView).viewControllers.firstObject;
    }
    
    return [currentView prefersStatusBarHidden];
    
}

#pragma mark - UIScrollView Delegate
/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (!self.bounces) {
        if (currentIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width) {
            scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
        } else if (currentIndex == self.viewControllers.count-1 && scrollView.contentOffset.x > scrollView.bounds.size.width) {
            scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
        }
    }
    
}
*/
/*
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    if (!self.bounces) {
        if (currentIndex == 0 && scrollView.contentOffset.x <= scrollView.bounds.size.width) {
            *targetContentOffset = CGPointMake(scrollView.bounds.size.width, 0);
        } else if (currentIndex == self.viewControllers.count-1 && scrollView.contentOffset.x >= scrollView.bounds.size.width) {
            *targetContentOffset = CGPointMake(scrollView.bounds.size.width, 0);
        }
    }
    
    
    
}
*/




@end

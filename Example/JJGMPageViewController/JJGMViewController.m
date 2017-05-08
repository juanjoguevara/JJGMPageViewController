//
//  JJGMViewController.m
//  JJGMPageViewController
//
//  Created by Juanjo Guevara on 8/5/17.
//  Copyright © 2017 juanjoguevara. All rights reserved.
//

#import "JJGMViewController.h"

@interface JJGMViewController ()

@end

@implementation JJGMViewController

-(id)init{
    
    self = [super initWithNibName:@"JJGMViewController" bundle:nil];
    
    if (self) {
       
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"1"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

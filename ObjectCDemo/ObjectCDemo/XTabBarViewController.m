//
//  XTabBarViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 4/18/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "XTabBarViewController.h"

@interface XTabBarViewController ()

@end

@implementation XTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    return NO;
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

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
    /**
     *  自己设计成自己的代理，然后执行
     */
    self.delegate = self;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *
 *
 *  @param tabBarController <#tabBarController description#>
 *  @param viewController   <#viewController description#>
 *
 *  @return 返回NO，就是停留在以前的tabbar的Seleted的Viewcontroller，如果YES，就继续挑战到选择的Viewcontroller。
 */
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    return YES;
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

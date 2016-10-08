//
//  CycleViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 4/22/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "CycleViewController.h"

@interface CycleViewController ()

@end

@implementation CycleViewController
/**
 *  这个方法可不能写
 */
//- (void)loadView
//{
//    NSLog(@"生命周期-loadView");
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"生命周期-Didload");
    self.title = @"生命周期";
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0 ; i<100; i++) {
        NSString *str = [NSString stringWithFormat:@"%@",@(i)];
        [array addObject:str];
    }
    NSLog(@"1=%@",array);
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0 ; i<100; i++) {
        NSString *str = [NSString stringWithFormat:@"%@",@(i)];
        [arr addObject:str];
    }
    NSLog(@"2=%@",arr);
//    传递链：由系统向离用户最近的view传递。UIKit –> active app’s event queue –> window –> root view –>……–>lowest view
//    响应链：由离用户最近的view向系统传递。initial view –> super view –> …..–> view controller –> window –> Application
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"生命周期-willappear");
}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"生命周期-didappear");
}
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"生命周期-willdisappear");
}
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"生命周期-diddisappear");
}
- (void)dealloc
{
    NSLog(@"生命周期-dealloc");
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

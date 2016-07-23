//
//  SecondViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "SecondViewController.h"
#import "xRefresh.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 400) style:UITableViewStylePlain];
    
    [self.view addSubview:table];
    [table addPullDownRefreshViewAutomaticallyAdjustsScrollView:nil Block:^(void) {
        
    }];
    [table removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

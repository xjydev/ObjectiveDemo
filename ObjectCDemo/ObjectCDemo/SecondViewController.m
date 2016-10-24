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
    table.backgroundColor = [UIColor redColor];
    [self.view addSubview:table];
    [table addPullDownRefreshViewAutomaticallyAdjustsScrollView:nil Block:^(void) {
        
    }];
    [table removeFromSuperview];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self arrayFunction];
}
- (void)arrayFunction {
//    NSArray *array = @[@"11",@"22",@"33",@"44",];
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}
- (void)keyChain {
    
//    SecItemAdd(<#CFDictionaryRef  _Nonnull attributes#>, <#CFTypeRef  _Nullable * _Nullable result#>)
//    KeychainItemWrapper *keychain=[[KeychainItemWrapper alloc] initWithIdentifier:@"xxxxxx" accessGroup:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

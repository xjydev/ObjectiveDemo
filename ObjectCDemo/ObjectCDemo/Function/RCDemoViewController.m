//
//  RCDemoViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 7/3/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "RCDemoViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface RCDemoViewController ()

@end

@implementation RCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [pasteLabel addPaste];
    
    [RACObserve(self, pro)subscribeNext:^(id x) {
        
    }];
    
   
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

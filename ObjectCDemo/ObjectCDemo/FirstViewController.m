//
//  FirstViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = @"CALayer";
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(120, 120, 100, 100)];
    label1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label1];
    
    label.layer.zPosition = 0;
    label1.layer.zPosition = 0;
    
    [UIView animateWithDuration:3 animations:^{
        label.layer.zPosition = 2;
        label1.layer.zPosition = 1;
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

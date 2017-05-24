//
//  UIDemoViewController.m
//  ObjectCDemo
//
//  Created by xiaodev on Feb/20/17.
//  Copyright © 2017 XiaoJingYuan. All rights reserved.
//

#import "UIDemoViewController.h"
#import "XXAlertView.h"
@interface UIDemoViewController ()<UIAlertViewDelegate>

@end

@implementation UIDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.0, @0.2, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 100, 300, 100);
    [self.view.layer addSublayer:gradientLayer];
    
}
- (IBAction)button1Action:(id)sender {
    [XXAlertView AlertViewWithTitle:@"1111" message:@"22222" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定",@"第二",@"第三"] hander:^(NSInteger buttonIndex) {
        NSLog(@"11===%@",@(buttonIndex));
    }];
}
- (IBAction)button2Action:(id)sender {
    UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"222" message:@"33333" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"第二",@"第三", nil];
    [aler show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"22 === %@",@(buttonIndex));
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

//
//  BlockViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 4/23/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "BlockViewController.h"
typedef void(^ getBackSuccess)( NSString *str);

@interface BlockViewController ()

@property (nonatomic,copy)getBackSuccess getbackSuccess ;

@end

@implementation BlockViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"block";
    self.view.backgroundColor = [UIColor whiteColor];
    //引用block函数
    [self getBack:^(NSString *str) {
        NSLog(@"back ==%@",str);
    }];
    //引用直接定义的Block
    [self getNewBack:^(NSString *st) {
        NSLog(@"st===%@",st);
    }];
    // Do any additional setup after loading the view.
}
/**
 *  定义一个Block函数
 *
 *  @param get Block类的
 */
- (void)getBack:(getBackSuccess)get
{
    get(@"block");
}
/**
 *  直接定义一个Block
 *
 *  @param getnew getnew description
 */
- (void)getNewBack:(void(^)(NSString *st))getnew{
    
    getnew(@"new block");
    
}
- (void)get:(void (^)(NSString *s))get{
    
    get(@"sssss");
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
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

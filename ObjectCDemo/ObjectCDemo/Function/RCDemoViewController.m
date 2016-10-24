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
    //监听pro
    [RACObserve(self, pro)subscribeNext:^(id x) {
        NSLog(@"pro == %@",x);
        NSLog(@"pro == %@",self.pro);
    }];
    
    //监听namearray，并且把0值赋给name
    RAC(self,name) = [RACObserve(self, nameArray)map:^id(NSArray * value) {
        NSLog(@"name ==%@",value);
        return value[0];
    }];
    
    //监听多个值里面的任何一个变化
  RAC(self,num) = [[RACSignal merge:@[
                        [RACObserve(self, name)distinctUntilChanged],
                        [RACObserve(self, pro)distinctUntilChanged],
                       ]]map:^id(id value) {
        
        self.num = self.num + 1;
        NSLog(@"merge ==%@ ==%@",value,@(self.num));
        return @(_num +1);
    }];
    
   
}
- (IBAction)nameArraybuttonAction:(id)sender {
    if (self.nameArray.count !=3) {
        self.nameArray = @[@"11111",@"222222",@"333333"];
    }
    else
    {
       self.nameArray = @[@"8888",@"11111",@"222222",@"333333"];
    }
    
}
- (IBAction)proButtonAction:(id)sender {
    if ([self.pro isEqualToString:@"1111"]) {
        self.pro = @"pro1";
    }
    else
    {
       self.pro = @"1111";
    }
    
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

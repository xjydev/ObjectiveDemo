//
//  KvokvcViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 4/19/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "KvokvcViewController.h"

@interface KvokvcViewController ()
{
    
    __weak IBOutlet UIButton *topButton;
    __weak IBOutlet UIScrollView *mainScrollView;
}
@end

@implementation KvokvcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainScrollView.contentSize = CGSizeMake(mainScrollView.frame.size.width, mainScrollView.frame.size.height*2);
    /**
     *  观察mainScrollview的移动
     */
    [mainScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"===%@==%@",change,object);
    topButton.frame = CGRectMake(topButton.frame.origin.x, topButton.frame.origin.x, topButton.frame.size.width-topButton.frame.size.width/2*(mainScrollView.frame.size.height*2/mainScrollView.contentOffset.y), topButton.frame.size.height);
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

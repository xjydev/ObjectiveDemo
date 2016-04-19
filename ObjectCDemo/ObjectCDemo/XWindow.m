//
//  XWindow.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "XWindow.h"
static XWindow *x = nil;
@implementation XWindow
-(void)xShow
{
    x = [[XWindow alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-200)/2, 100, 200, 200)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 50, 100, 50);
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(windowremove:) forControlEvents:UIControlEventTouchUpInside];
    [x addSubview:button];
    x.backgroundColor = [UIColor redColor];
    x.windowLevel = UIWindowLevelAlert;
    x.hidden = NO;
    [x makeKeyAndVisible];
    
    
}
- (void)windowremove:(UIButton *)button
{
    x.hidden = YES;
    [x resignKeyWindow];
    if (x) {
        [x removeFromSuperview];
        x = nil;
        NSLog(@"%@",x);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

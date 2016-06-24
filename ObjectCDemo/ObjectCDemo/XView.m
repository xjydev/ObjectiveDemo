//
//  XView.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 4/21/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "XView.h"

@implementation XView
/**
 *  UIView是用来显示内容的，可以处理用户事件
 CALayer是用来绘制内容的，对内容进行动画处理依赖与UIView来进行显示，不能处理用户事件。
 *UIView依赖与calayer提供的内容，CALayer依赖uivew提供的容器来显示绘制的内容。归根到底CALayer是这一切的基础，如果没有CALayer，UIView自身也不会存在，UIView是一个特殊的CALayer实现，添加了响应事件的能力

 */
/**
 *  响应链的问题，后期好好研究
 *
 *  @param point <#point description#>
 *  @param event <#event description#>
 *
 *  @return <#return value description#>
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return self.subviews.lastObject;
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSThread *thread = [NSThread currentThread];
    NSLog(@"00===%@",thread);
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return self;
}

- (id)init
{
    self = [super init];
    NSThread *thread = [NSThread currentThread];
    NSLog(@"11===%@",thread);
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  NSThread *thread = [NSThread currentThread];
    //获取当前线程，会发现其实就是在主线程中执行的。
    NSLog(@"22===%@",thread);
}


@end

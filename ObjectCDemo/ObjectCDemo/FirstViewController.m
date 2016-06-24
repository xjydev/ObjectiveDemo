//
//  FirstViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//
/**
 *  这个Viewcontroller用于写代码，便于修改测试
 *
 */
#import "FirstViewController.h"
#import "XView.h"
#import "ThriftManger.h"

@interface FirstViewController ()
{
    
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat heih = 20;
    
    NSString * cLabelString = @"这是测试UILabel行间距的text。这是测试UILabel行间距的text。n 这是测试UILabel行间距的text。n 这是测试UILabel行间距的text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。";
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, heih, 280, 200)];
    cLabel.numberOfLines = 0;
    cLabel.font = [UIFont systemFontOfSize:16];
    cLabel.textColor = [UIColor grayColor];
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:cLabelString];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:8];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [cLabelString length])];
    [cLabel setAttributedText:attributedString1];
    [cLabel sizeToFit];
    [self.view addSubview:cLabel];
    
    
//    int i =0;
//    while (i<100) {
//        NSLog(@"===%d",i);
//        while (i>3){
//            NSLog(@"====%d",i);
//        };
//        NSLog(@"==%d==%d",i,i%5);
//        while (i%5==4){
//            NSLog(@"======%d",i);
//        };
//        NSLog(@"==%d",i);
//        i++;
//    }
    
    XView  *view = [[XView  alloc]initWithFrame:CGRectMake(200, 64, 200, 200)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    NSThread *thread = [NSThread currentThread];
    NSLog(@"===%@",thread);
//
//    XView *littleView = [[XView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    littleView.backgroundColor = [UIColor redColor];
//    [view addSubview:littleView];
//    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    label.text = @"CALayer";
//    label.backgroundColor = [UIColor redColor];
//    [self.view addSubview:label];
//    
//    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(120, 120, 100, 100)];
//    label1.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:label1];
//    
//    label.layer.zPosition = 0;
//    label1.layer.zPosition = 0;
//    
//    [UIView animateWithDuration:3 animations:^{
//        label.layer.zPosition = 2;
//        label1.layer.zPosition = 1;
//        
//    }];
    
}
- (NSString *)getUnitTestString:(NSString *)str
{
    return str;
}
- (IBAction)buttonAction:(id)sender {
    [[ThriftManger alloc] sendVerification];
    
    NSString *const st1 = @"ss";
    //    st1 = @"s1";不可赋值
    const NSString *st2 = @"ss2";
    //指针的值可以修改，指向的值不可修改。
    st2 = @"s2";
    NSLog(@"%@==%@",st1,st2);
    
    //    extern const NSString *e1=@"11";不能初始化
    
    const NSString *e1 = @"e1";
    NSLog(@"%@",e1);

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSString *const st1 = @"ss";
    //    st1 = @"s1";不可赋值
    const NSString *st2 = @"ss2";
    //指针的值可以修改，指向的值不可修改。
    st2 = @"s2";
    NSLog(@"%@==%@",st1,st2);
    
    //    extern const NSString *e1=@"11";不能初始化
    
    const NSString *e1 = @"e1";
    NSLog(@"%@",e1);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

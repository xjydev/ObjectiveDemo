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
#import "ObjectCDemo-Swift.h"
#import <AssetsLibrary/AssetsLibrary.h>

#import <AFNetworking/AFNetworking.h>
@interface FirstViewController ()
{
    
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat heih = 80;
    
    NSString * cLabelString = @"在iOS开发中，常常会有一段文字显示不同的颜色和字体，或者给某几个文字加删除线或下划线的需求。之前在网上找了一些资料，有的是重绘UILabel的textLayer，\n有的是用HTML5实现的，都比较麻烦，而且很多UILabel的属性也不起作用了，效果都不理想设置段距。\n后来了解到NSMuttableAttstring（带属性的字符串），上面的一些需求都可以很简便的实现。";
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, heih, self.view.frame.size.width, 200)];
    cLabel.numberOfLines = 0;
    cLabel.font = [UIFont systemFontOfSize:16];
    cLabel.textColor = [UIColor grayColor];
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:cLabelString];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:8];//设置行距
    [paragraphStyle1 setParagraphSpacing:20];//设置段距
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [cLabelString length])];//设置上面的参数
    
    [attributedString1 addAttributes:@{NSStrokeWidthAttributeName:@(3),NSStrokeColorAttributeName:[UIColor redColor]} range:NSMakeRange(0, 10)];//设置空心
    [attributedString1 addAttributes:@{NSForegroundColorAttributeName:[UIColor yellowColor],NSStrokeWidthAttributeName:@(-3),NSStrokeColorAttributeName:[UIColor redColor]} range:NSMakeRange(10, 10)];//设置黄心
    
    [attributedString1 addAttributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSBaselineOffsetAttributeName:@0,NSStrikethroughColorAttributeName:[UIColor redColor]} range:NSMakeRange(20, 10)];//中部线
    [attributedString1 addAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:[UIColor redColor]} range:NSMakeRange(30, 10)];//中部线
    
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor yellowColor];
    shadow.shadowOffset = CGSizeMake(2, 4);
    shadow.shadowBlurRadius = 5;
    [attributedString1 addAttributes:@{NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:@0} range:NSMakeRange(40, 10)];//设置阴影
    
    [attributedString1 addAttributes:@{NSObliquenessAttributeName:@(1)} range:NSMakeRange(50, 10)];//设置斜体
    
     [attributedString1 addAttributes:@{NSBackgroundColorAttributeName:[UIColor yellowColor]} range:NSMakeRange(60, 10)];//设置斜体
     [attributedString1 addAttributes:@{NSVerticalGlyphFormAttributeName:@1} range:NSMakeRange(70, 10)];//设置斜体
    
    [cLabel setAttributedText:attributedString1];
    [cLabel sizeToFit];//label适配文字
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
    
    XView  *view = [[XView  alloc]initWithFrame:CGRectMake(200, 364, 200, 200)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    view.layer.cornerRadius = 100;
    view.clipsToBounds = YES;
    
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
    [self.gifImageView setImage:[UIImage imageNamed:@"刷新静态"]];
//    self.gifImageView.animating = YES;
    
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 29, 29)];
//    NSDictionary *info = [[NSBundle mainBundle]infoDictionary];
//    NSString *ico = [info valueForKey:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"];
//    NSString *path =[[NSBundle mainBundle]pathForResource:@"AppIcon" ofType:@"png"];
//    imageView.backgroundColor = [UIColor yellowColor];
//    [imageView setImage:[UIImage imageWithContentsOfFile:path]];
//    [self.view addSubview:imageView];
    [[AFHTTPSessionManager manager]GET:@"http://localhost:9100/htdocs/Basic/Server/APi.php?" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"==%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error====%@",error);
    }];
}


- (NSString *)getUnitTestString:(NSString *)str
{
    return str;
}
- (IBAction)buttonAction:(id)sender {
        
    const NSString *e1 = @"e1";
    NSLog(@"%@",e1);

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.gifImageView.animating = !self.gifImageView.animating;
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
/**
 * 把阿拉伯数字转换成汉字数字
 *
 *  @param arebic 阿拉伯数字字符串
 *
 *  @return 汉字数字字符串
 */
-(NSString*)translation:(NSString *)arebic

{   NSString *str = arebic;
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    NSLog(@"%@ to %@",str,chinese);
    return chinese;
}
- (IBAction)swiftDemoAction:(id)sender {
//    SwiftUIViewController *swiftContro = [[SwiftUIViewController alloc]init];
//    swiftContro.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:swiftContro animated:YES];
    UIViewController * swiftCon = [self.storyboard instantiateViewControllerWithIdentifier:@"SwiftUIViewController"];
    [self.navigationController pushViewController:swiftCon animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

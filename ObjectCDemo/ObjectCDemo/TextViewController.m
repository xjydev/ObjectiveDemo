//
//  TextViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 5/27/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()
{
    
    IBOutlet UILabel *_textLabel;
}
@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * cLabelString = @"这是测试UILabel行间距的text。这是测试UILabel行间距的text。n 这是测试UILabel行间距的text。n 这是测试UILabel行间距的text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。\n text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。这是测试UILabel行间距的text。";
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:cLabelString];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:11];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [cLabelString length])];
    
    NSMutableParagraphStyle *paragraphStyleDuan = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyleDuan setParagraphSpacing:30];  //调整段间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyleDuan range:NSMakeRange(0, [cLabelString length])];
    
    [_textLabel setAttributedText:attributedString];
    [_textLabel sizeToFit];

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

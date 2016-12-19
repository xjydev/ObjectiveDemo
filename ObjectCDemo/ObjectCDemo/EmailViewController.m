//
//  EmailViewController.m
//  ObjectCDemo
//
//  Created by xiaodev on Dec/19/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>
@interface EmailViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([MFMailComposeViewController canSendMail] == YES) {
        
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        //  设置代理(与以往代理不同,不是"delegate",千万不能忘记呀,代理有3步)
        mailVC.mailComposeDelegate = self;
        //  收件人
        NSArray *sendToPerson = @[@"xiaodeve@163.com"];
        [mailVC setToRecipients:sendToPerson];
        //                //  抄送
        //                NSArray *copyToPerson = @[@"humingtao2013@126.com"];
        //                [mailVC setCcRecipients:copyToPerson];
        //                //  密送
        //                NSArray *secretToPerson = @[@"563821250@qq.com"];
        //                [mailVC setBccRecipients:secretToPerson];
        //  主题
        [mailVC setSubject:@"悦览播放意见反馈"];
        [self presentViewController:mailVC animated:YES completion:nil];
        [mailVC setMessageBody:@"填写您想要反馈的问题……" isHTML:NO];
    }else{
        NSLog(@"此设备不支持邮件发送");
    }
    
}
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled: // 用户取消编辑
            NSLog(@"Mail send canceled...");
            break;
        case MFMailComposeResultSaved: // 用户保存邮件
            NSLog(@"Mail saved...");
            break;
        case MFMailComposeResultSent: // 用户点击发送
            NSLog(@"Mail sent...");
            break;
        case MFMailComposeResultFailed: // 用户尝试保存或发送邮件失败
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
            break;
    }
    // 关闭邮件发送视图
    [self dismissViewControllerAnimated:YES completion:nil];
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

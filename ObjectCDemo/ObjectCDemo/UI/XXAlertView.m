//
//  XXAlertView.m
//  ObjectCDemo
//
//  Created by xiaodev on Feb/20/17.
//  Copyright © 2017 XiaoJingYuan. All rights reserved.
//

#import "XXAlertView.h"

@implementation XXAlertView
+(void)AlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray *)otherButtonTitles hander:(void(^)(NSInteger buttonIndex))block {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        block(0);
    }];
    for (NSInteger i = 0;i<otherButtonTitles.count;i++) {
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            block(i+1);
        }];
        [alert addAction:otherAction];
    }
    [alert addAction:cancleAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:^{
        
    }];

}
@end

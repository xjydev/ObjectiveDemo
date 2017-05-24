//
//  XXAlertView.h
//  ObjectCDemo
//
//  Created by xiaodev on Feb/20/17.
//  Copyright © 2017 XiaoJingYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XXAlertView : NSObject
+(void)AlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray *)otherButtonTitles hander:(void(^)(NSInteger buttonIndex))block ;
@end

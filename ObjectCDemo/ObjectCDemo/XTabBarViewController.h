//
//  XTabBarViewController.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 4/18/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTabBarViewController : UITabBarController<UITabBarControllerDelegate>

@end
@protocol XTabBarControllerDelegate <UITabBarControllerDelegate>


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;

@end

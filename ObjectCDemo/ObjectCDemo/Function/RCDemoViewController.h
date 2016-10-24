//
//  RCDemoViewController.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 7/3/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasteLabel.h"
@interface RCDemoViewController : UIViewController
{
    
    __weak IBOutlet PasteLabel *pasteLabel;
}
@property (nonatomic, copy)NSString *pro;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong)NSArray *nameArray;
@property (nonatomic, assign)NSInteger    num;
@end

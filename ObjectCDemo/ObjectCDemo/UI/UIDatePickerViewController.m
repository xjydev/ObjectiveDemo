//
//  UIDatePickerViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 5/9/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "UIDatePickerViewController.h"

@interface UIDatePickerViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    IBOutlet UIDatePicker *_datePicker;
}
@end

@implementation UIDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
////    NSDateFormatter *datef = [[NSDateFormatter alloc]init];
////    [datef setDateFormat:@"YYYY年MM月dd天 aa"];
////    NSDate *temDate = [datef dateFromString:_datePicker.]
////    [_datePicker setDate:datef];
//}
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

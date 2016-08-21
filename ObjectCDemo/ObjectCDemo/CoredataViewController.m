//
//  CoredataViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 6/27/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "CoredataViewController.h"
#import "XManageCoreData.h"
@interface CoredataViewController ()
{
    NSManagedObjectContext *_context;
}
@end

@implementation CoredataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)search:(id)sender {
  NSArray *arr = [[XManageCoreData manageCoreData]searchSortDescriptors:@{@"age":@"1"} forEntityName:@"Person" searchContext:@""];
    NSLog(@"===%@",arr);
//     saveObjectsDict:@{@"age":@"1"} forEntityName:@"Person" searchContext:@""];
}
- (IBAction)save:(id)sender {
    [[XManageCoreData manageCoreData] saveObjectsDict:@{@"name":@"jike1",@"age":[NSNumber numberWithInt:10]} forEntityName:@"Person"];
}
- (IBAction)dele:(id)sender {
    
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

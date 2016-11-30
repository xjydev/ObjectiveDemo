//
//  FileManagerViewController.m
//  ObjectCDemo
//
//  Created by xiaodev on Nov/14/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "FileManagerViewController.h"

@interface FileManagerViewController ()
{
    NSFileManager   *_fileManager;

    
}
@end

@implementation FileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fileManager = [NSFileManager defaultManager];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

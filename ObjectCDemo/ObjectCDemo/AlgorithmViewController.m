//
//  AlgorithmViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 6/15/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "AlgorithmViewController.h"
#import <mach/mach_time.h>
@interface AlgorithmViewController ()
{
       NSMutableArray *_mArray;
       NSDate *_date;
}
@end

@implementation AlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bubblingSort];
    [self quickSort];
}

//快速排序算法
- (void)quickSort
{
   
    _mArray = [NSMutableArray arrayWithObjects:@(80),@(30),@(65),@(34),@(74),@(46),@(98),@(22),@(67),@(52),@(67),@(52),@(66),@(77),@(67),@(12),@(52),@(52),@(52),@(58),@(8),@(45),@(23),@(88),@(52),@(33),@(90),@(52),@(67),@(44),@(12),@(8),@(93), nil];
     NSDate *sDate = [NSDate date];
    //    uint64_t start1 = mach_absolute_time();
    [self sortArrayLeft:0 Right:_mArray.count-1];
    double  d= [[NSDate date]timeIntervalSinceDate:sDate];
    NSLog(@"1==%@==%f",sDate,d);
    //    uint64_t end1 = mach_absolute_time();
    //    NSLog(@"1==%@",@(start1 - end1));
    NSLog(@"1==%@",_mArray);

}
- (void)sortArrayLeft:(NSInteger)left Right:(NSInteger)right
{

    if (right>left) {
        NSInteger i = left;
        NSInteger j = right+1;
        while (true) {
            while (j+1<_mArray.count &&_mArray[++i]<_mArray[left]) ;
            while (j>0&&_mArray[left]<_mArray[--j]);
            if (i>=j) {
                break;
            }
            [_mArray exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
        
        
        [_mArray exchangeObjectAtIndex:left withObjectAtIndex:j];
        [self sortArrayLeft:left Right:j-1];
        [self sortArrayLeft:j+1 Right:right];
    }
    
}
- (void)quiteSortArrayLeft:(NSInteger)left Right:(NSInteger)right
{
    if (right>left) {
        NSInteger i = left;
        NSInteger j = right+1;
        while (i>j) {
            if (j+1<_mArray.count&&_mArray[++i]>_mArray[left]) {
                
            }
            if (j>0&&_mArray[left]>_mArray[--j]) {
                
            }
        }
    }
}
//冒泡排序
- (void)bubblingSort
{
    NSMutableArray *bArray = [NSMutableArray arrayWithObjects:@(80),@(30),@(65),@(34),@(74),@(46),@(98),@(22),@(67),@(52),@(67),@(52),@(66),@(77),@(67),@(12),@(52),@(52),@(52),@(58),@(8),@(45),@(23),@(88),@(52),@(33),@(90),@(52),@(67),@(44),@(12),@(8),@(93), nil];
    NSDate *stDate = [NSDate date];
//     uint64_t start = mach_absolute_time();
    for (NSInteger i = bArray.count-1; i>0; i--) {
        for (NSInteger j = 0; j<i; j++) {
            if (bArray[j]>bArray[j+1]) {
                [bArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
//    uint64_t end = mach_absolute_time();
    double l = [[NSDate date]timeIntervalSinceDate:stDate];
    NSLog(@"0==%@==%f",stDate,l);
//    NSLog(@"0==%@",@(start - end));
    NSLog(@"0===%@",bArray);
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

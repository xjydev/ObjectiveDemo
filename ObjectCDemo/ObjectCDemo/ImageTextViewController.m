//
//  ImageTextViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 6/7/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "ImageTextViewController.h"
#import "UIImageView+WebCache.h"
@interface ImageTextViewController ()
{
    NSMutableArray *_mArray;
    NSString    *_keyStr;
}
@end

@implementation ImageTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self strings];

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"===%@",change);
}

- (void)sortarrayWith:(NSInteger)left Right:(NSInteger)right
{
    if (right>left) {
        NSInteger i = left;
        NSInteger j = right+1;
        
            while ((j+1<_mArray.count &&_mArray[++i]>_mArray[left])||(j>0&&_mArray[left]>_mArray[--j])) {
                if (i>=j) {
                    break;
                }
                [_mArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
            
        
        [_mArray exchangeObjectAtIndex:left withObjectAtIndex:j];
        [self sortarrayWith:left Right:j-1];
        [self sortarrayWith:j+1 Right:right];
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)strings {
    NSMutableString *cs =[NSMutableString stringWithString: @"3456"];
    NSString *s = @"6";
    
    if ([cs containsString:s]) {
        NSRange r =[cs rangeOfString:s];
        [cs deleteCharactersInRange:r];
        
    }
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

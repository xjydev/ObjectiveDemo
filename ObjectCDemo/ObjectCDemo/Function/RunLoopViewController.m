//
//  RunLoopViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 6/17/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "RunLoopViewController.h"

@interface RunLoopCell:UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
//- (void)setTimer;
@end
@implementation RunLoopCell

//- (void)setTimer{
//    NSTimer *time = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeBegain) userInfo:nil repeats:YES];
//}
//- (void)timeBegain
//{
//    self.countLabel.text = [NSString stringWithFormat:@"%03d",[self.countLabel.text intValue]+1];
//}
@end
@interface RunLoopViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *headLabel;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UILabel *footLabel;
@end

@implementation RunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //
   NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerBegain) userInfo:nil repeats:YES];
    //然后让time添加到NSRunLoopCommonModes里面，滑动的时候就可以不影响了。
    [[NSRunLoop currentRunLoop]addTimer:time forMode:NSRunLoopCommonModes];
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//         NSTimer *foottimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(foottimerBegain) userInfo:nil repeats:YES];
//    });
    for (int i = 0 ; i<10; i++) {
        if (i == 5) {
            continue;
        }
        NSLog(@"====%d",i);
    }
    
}
- (void)foottimerBegain{
   self.footLabel.text = [NSString stringWithFormat:@"%03d",[self.footLabel.text intValue]+1];
}
- (void)timerBegain
{
    self.headLabel.text = [NSString stringWithFormat:@"%03d",[self.headLabel.text intValue]+1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RunLoopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RunLoopCell" forIndexPath:indexPath];
   
    return cell;
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

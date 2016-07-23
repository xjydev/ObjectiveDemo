//
//  LastTableViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//
/**
 *  iOS自带控件的研究
 *
 *  @return return value description
 */
#import "LastTableViewController.h"
#import "XWindow.h"
#import "xRefresh.h"

@interface LastTableViewController ()
{
    NSArray    *_lastArray;
}
@end

@implementation LastTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"控件";
    
    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    _lastArray =
    @[@{@"title":@"UIWindow",@"class":@""},
      @{@"title":@"UITableView",@"class":@""},
      @{@"title":@"ScrollView",@"class":@""},
      @{@"title":@"UICollectionView",@"class":@""},
      @{@"title":@"UIPickerView",@"class":@""},
      @{@"title":@"UIWebView",@"class":@""},
      @{@"title":@"UIContainerView",@"class":@""},
      @{@"title":@"UILabel",@"class":@""},
      @{@"title":@"UIView",@"class":@""},
      @{@"title":@"UIProgress",@"class":@""},
      @{@"title":@"UIAlerView",@"class":@""},
      @{@"title":@"UISegmented",@"class":@""},
      @{@"title":@"UITextField",@"class":@""},
      @{@"title":@"UITextView",@"class":@""},];
    self.tableView.rowHeight = 80;
    [self.tableView addPullDownRefreshViewAutomaticallyAdjustsScrollView:self.automaticallyAdjustsScrollViewInsets Block:^(void) {
        NSLog(@"   refresh");
    }];
    [self.tableView addPullUpRefreshView:^(void) {
        NSLog(@"   increase");
    }];
     NSLog(@"==%f==%f==%f",self.tableView.contentOffset.y,self.tableView.contentInset.top,self.tableView.bounds.origin.y);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _lastArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lastcell" forIndexPath:indexPath];
    
    cell.textLabel.text = _lastArray[indexPath.row][@"title"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            XWindow *x = [[XWindow alloc]init];
            [x xShow];
        }
            break;
            
        default:
            break;
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"11==%f==%f",self.tableView.bounds.origin.y,self.tableView.superview.bounds.origin.y);
}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"22==%f",self.tableView.bounds.origin.y);
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

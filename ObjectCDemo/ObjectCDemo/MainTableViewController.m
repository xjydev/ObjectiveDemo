//
//  MainTableViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "MainTableViewController.h"
#import "RunTimeViewController.h"
#import "KvokvcViewController.h"
#import "CycleViewController.h"
#import "BlockViewController.h"
@interface MainTableViewController ()
{
    NSArray    *_mainArray;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  Model-View-Controller 在MVC下，所有的对象被归类为一个model，一个view，或一个controller。Model持有数据，View显示与用户交互的界面，而View Controller调解Model和View之间的交互。
     */
    /**
     *  MVVM Model-View-ViewModel ，ViewModel处理Model，使View可以直接使用。
     */
    
    
    /**
     *  每一个知识点都在这里写上。
     */
    _mainArray = @[@"runtime",@"CoreData",@"KVO/KVC",@"生命周期",@"Block"];
    float a = 3.15;
    NSLog(@"%.1f===%0.1f",a,a);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return _mainArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maincell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _mainArray[indexPath.row];
    return cell;
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            RunTimeViewController *o =[[RunTimeViewController alloc]init];
            o.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:o animated:YES];
            
        }
            break;
        case 1:
        {
            RunTimeViewController *o =[[RunTimeViewController alloc]init];
            o.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:o animated:YES];
           
        }
            break;
        case 2:
        {
            KvokvcViewController *o =[[KvokvcViewController alloc]init];
            o.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:o animated:YES];
            
        }
            break;
        case 3:
        {
            CycleViewController *o =[[CycleViewController alloc]init];
            o.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:o animated:YES];
           
        }
            break;
        case 4:
        {
            BlockViewController *o =[[BlockViewController alloc]init];
            o.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:o animated:YES];
            
        }
            break;
            
        default:
            break;
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

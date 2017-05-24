//
//  ThreadViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 6/15/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()
{
    NSString       *_keyStr;
}
@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self lockNsthread];
    [self gcdThread];
//    [self nsThreadFunction];
}
#pragma mark -- NSThread

- (void)nsThreadFunction {
    NSLog(@"==%f",pow(1.1, 10));
    //创建
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(nsThreadAction) object:nil];
    //启动
    [thread start];
    
    
    [self performSelector:@selector(nsthreadRun) withObject:nil];
    [NSThread detachNewThreadSelector:@selector(nsthreadNew) toTarget:self withObject:nil];
}
- (void)nsThreadAction
{
    NSLog(@"nsthread1 == %@",[NSThread currentThread]);
}
- (void)nsthreadRun
{
    NSLog(@"nsthread2 == %@",[NSThread currentThread]);
}
- (void)nsthreadNew {
    NSLog(@"nsthread3 == %@",[NSThread currentThread]);
}
#pragma mark -- NSOperation
- (void)oparetionthreadDemo {
    NSOperationQueue *qu = [[NSOperationQueue alloc]init];
    qu.maxConcurrentOperationCount = 2;//最大执行数同时。
    NSBlockOperation *bo = [NSBlockOperation blockOperationWithBlock:^{
        NSInteger i=0;
        while (i++<18) {
            NSLog(@"11--%@",@(i));
        }
        NSLog(@"opention 1111 ==%@",[NSThread currentThread]);
        _keyStr = @"88888888";
    }];
    [bo addExecutionBlock:^{
       NSLog(@"opention 2222 ==%@",[NSThread currentThread]);
    }];
    
    NSInvocationOperation *io = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(whiledemo) object:nil];
    
    
    [qu addOperation:bo];
    [qu addOperation:io];
    
    NSOperationQueue *qu2 = [[NSOperationQueue alloc]init];
    [qu2 addOperationWithBlock:^{
        
        [qu waitUntilAllOperationsAreFinished];
        NSLog(@"operton 3333 == %@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *bo2 = [NSBlockOperation blockOperationWithBlock:^{
        [qu waitUntilAllOperationsAreFinished];
        NSInteger i = 0;
        while (i++<5) {
            NSLog(@"44 ++ %@",@(i));
        }
        NSLog(@"opertion 4444 == %@",[NSThread currentThread]);
    }];
    [qu2 addOperation:bo2];
    
    
}
- (void)whiledemo {
    if (1) {
        NSInteger i=0;
        while (i<40) {
            while (++i%2 == 1) ;
            while (++i/3>9) ;
            NSLog(@"55 ==%@",@(i));
            
        }
        NSLog(@"Opertion 55 === %@",[NSThread currentThread]);
    }
    
}
#pragma mark--GCD
//gcd的一个死锁
- (void)lockNsthread
{
    //第一个参数Queue的名称，第二个参数，DISPATCH_QUEUE_SERIAL 或 NULL 表示创建串行队列，DISPATCH_QUEUE_CONCURRENT 表示创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"gcd1 == %@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"gcd2 == %@",[NSThread currentThread]);
        //同步要等到其他任务执行完成，才会执行这个同步任务。但是上一个任务就是这个这个同步任务。我等你执行完我执行，你要我执行才能执行完。死锁！3、4不打印
        dispatch_sync(queue, ^{
          NSLog(@"gcd3 == %@",[NSThread currentThread]);
        });
        NSLog(@"gcd4 == %@",[NSThread currentThread]);
    });
    NSLog(@"gcd5 == %@",[NSThread currentThread]);
}

- (void)gcdThread {
    //主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    NSLog(@"main===%@",mainQueue);
    
    //创建一个队列组
    dispatch_group_t group = dispatch_group_create();
    //全局并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        NSInteger i = 0;
        while (i++<18) {
            NSLog(@"11 === %@",@(i));
        }
         NSLog(@"gcd11111 == %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSInteger i = 10;
        while (i++<23) {
            NSLog(@"22 === %@",@(i));
        }
         NSLog(@"gcd2222 == %@",[NSThread currentThread]);
    });
    //完成后通知
    dispatch_group_notify(group, queue, ^{
         NSLog(@"gcd3333 == %@",[NSThread currentThread]);
    });
    //阻塞
    dispatch_barrier_async(queue, ^{
        NSInteger i = 0;
        while (i<10) {
            i++;
            NSLog(@"44 == %@",@(i));
        }
        NSLog(@"gcd 4444 == %@",[NSThread currentThread]);
    });
    
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

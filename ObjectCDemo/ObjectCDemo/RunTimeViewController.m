//
//  RunTimeViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "RunTimeViewController.h"
#import "RunD.h"
#import <objc/runtime.h>
@interface RunTimeViewController ()

@end

@implementation RunTimeViewController
- (void)dealloc
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    RunD *d = [[RunD alloc]init];
    NSString *dName = [NSString stringWithCString:object_getClassName(d) encoding:NSUTF8StringEncoding];
    NSLog(@"name==%@===",dName);
//    NSLog(@"==%d",(int)self.retainCount);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationAction) name:@"nil" object:nil];
    
//   NSLog(@"==%d",(int)self.retainCount);
   
//    u_int count;
//    objc_property_t *propertis = class_copyPropertyList(d, &count);
//    for (int i = 0; i<count; i++) {
//        const char *propertyName = property_getName(propertis[i]);
//        NSString *pname = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
//        NSLog(@"pname == %@",pname);
//    }
    
    [self performSelector:@selector(doSomething)];
}
- (void)notificationAction
{
    
}
int cfunction(id self, SEL _cmd, NSString *str) {
    NSLog(@"%@", str);
    return 10;//随便返回个值
}
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(doSomething)) {
        NSLog(@"add method here");
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
void dynamicMethodIMP(id self,SEL_cmd)
{
    NSLog(@"doSomething SEL");
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

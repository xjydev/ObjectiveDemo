//
//  RunTimeViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//
/*
 OC采用“消息机制”，函数调用就是对象发送一条消息，oc跳过编译，在运行的时候才动态的添加函数调用，在运行的时候才决定要调用什么方法。
 */
#import "RunTimeViewController.h"
#import "RunD.h"
#import <objc/runtime.h>
@interface RunTimeViewController ()<RunDelegate>

@end

@implementation RunTimeViewController
- (void)dealloc
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    RunD *d = [[RunD alloc]init];
#pragma mark -- 获取类名
    NSString *dName = [NSString stringWithCString:object_getClassName(d) encoding:NSUTF8StringEncoding];
    NSLog(@"ClassName==%@===",dName);
    unsigned int count = 0;
#pragma mark -- 添加属性
    static char *height = "height"  ;
    objc_setAssociatedObject(d,height, @(179), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSLog(@"Associated==%@",objc_getAssociatedObject(d, height));
    
    
#pragma mark -- 获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([RunD class], &count);
    for (unsigned int i = 0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"propertyName===%@",[NSString stringWithUTF8String:propertyName]);
        
    }
#pragma mark -- 添加方法
   //(IMP)runAdd 是runAdd的地址指针，
    //"v@:"v代表无返回值void，如果是i则代表int；@代表 id sel; : 代表 SEL _cmd;例如“v@:@@” 意思是，两个参数的没有返回值。
    class_addMethod([RunD class], @selector(runAddFunc), (IMP)runAdd, "v@:");
    
#pragma mark -- 获取方法列表
    unsigned int methCount = 0;
    Method *methList = class_copyMethodList([RunD class], &methCount);
    for (unsigned int i = 0 ; i<methCount; i++) {
        Method meth = methList[i];
        NSLog(@"meth == %@",NSStringFromSelector(method_getName(meth)));
    }
    
#pragma mark -- 获取成员变量列表
    unsigned int ivarCount = 0;
    Ivar *ivarList = class_copyIvarList([RunD class], &ivarCount);
    for (unsigned int i = 0; i<ivarCount; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"ivar == %@",[NSString stringWithUTF8String:ivarName]);
        //为变量赋值
        if ([[NSString stringWithUTF8String:ivarName] isEqualToString:@"_name"]) {
            object_setIvar(d, ivar, @"xiao");
            NSLog(@"d.name == %@",d.name);
        }
    }
    //用完释放掉
    free(ivarList);
#pragma mark -- 获取协议列表
    unsigned int protocolCount = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([RunD class], &protocolCount);
    for (unsigned int i = 0; i<protocolCount; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        NSLog(@"protocol == %@",[NSString stringWithUTF8String:protocolName]);
        
    }
#pragma mark -- 获取类方法
    SEL runSel = @selector(createRunDPerson);
    Method runMethod =class_getInstanceMethod([RunD class], runSel);
    NSLog(@"classMeth == %@",NSStringFromSelector(method_getName(runMethod)));
#pragma mark -- 交互两个方法的实现
    Method m1 = class_getInstanceMethod([RunD class], @selector(runFunc));
    Method m2 = class_getInstanceMethod([RunD class], @selector(runFunction));
    method_exchangeImplementations(m1, m2);
    //显示runFunction方法的效果
    [d runFunc];
#pragma mark --拦截并替换方法
    //原方法
    Method md = class_getInstanceMethod([RunD class], @selector(runFunction));
    //将要替换的方法
    Method ms = class_getInstanceMethod([self class], @selector(runTimeFunction));
    //先尝试添加给类添加一个方法，避免原方法没有实现（runFunction）此方法。
    BOOL adds = class_addMethod([RunD class], @selector(runFunction), method_getImplementation(ms), method_getTypeEncoding(ms));
    if (adds) {
       //添加成功，将原方法的实现替换到交换方法。
        class_replaceMethod([self class], @selector(runTimeFunction), method_getImplementation(md), method_getTypeEncoding(md));
    }
    else
    {
        //添加失败说明原方法已经实现了，交换这两个方法的实现。
        method_exchangeImplementations(md, ms);
    }
//应该显示的是self 的runTimeFunction方法
    [d runFunction];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationAction) name:@"nil" object:nil];
    
    
    [self performSelector:@selector(doSomething)];
}
//(id self,SEL _cmd)两个参数是必须有的
void runAdd(id self,SEL_cmd)
{
    NSLog(@"runD 添加一个方法");
}
- (void)runTimeFunction
{
    NSLog(@" self runTimeFunction");
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

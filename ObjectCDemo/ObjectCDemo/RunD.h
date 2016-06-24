//
//  RunD.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 4/5/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol RunDelegate ;
@interface RunD : NSObject
{
    NSString * _birthday;
}
@property (nonatomic, strong)NSString *time;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, assign)unsigned int age;
+ (instancetype)createRunDPerson;
- (void)initWithName:(NSString *)name Age:(NSInteger)age;
- (void)runFunc;
- (void)runFunction;
@end
@protocol RunDelegate <NSObject>

- (void)runDSelectAge:(unsigned int)age;

@end
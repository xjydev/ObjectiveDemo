//
//  FirstViewController.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
/**
 *  atomic 默认值 通过锁定机制来确保其操作的原子性 如果两个线程同时读取一个属性，那么不论何时，总能看到有效的属性值。
 *  nonatomic 非原子性 如果该对象无需考虑多线程的情况，请加入这个属性， 使用同步锁的开销比较大， 这会带来性能问题。
 *  strong 相当于retain,这里可以替代。引数+1；默认值
 */
@property (nonatomic,strong)UIView *aView;
@property (nonatomic,retain)UIView *bView;
/**
 *  虽然这个weak 相当于assign，但是这里你用个试试，报错。weak必须是object类型。引数不加1；
 * 对象没有的时候，weak会把指针值为nil
  * assign 默认值
 */
@property (nonatomic,assign)NSInteger a;
/**
 *  引数不加1
 */
@property (nonatomic,weak) UIView *b;
/**
 *  copy 传说中的深拷贝，直接一个新的对象。
 *__unsafe_unretained 声明一个弱应用，但是不会自动nil化，也就是说，如果所指向的内存区域被释放了，这个指针就是一个野指针了。
 */
@property (nonatomic,copy)NSString *str ;

@end


//
//  XRefresh.h
//  ObjectCDemo
//  Version 1.1.0
//  Created by XiaoJingYuan on 5/23/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, XRefreshState) {
    XRefreshStateBeganDrag = 0,     // 开始拉。
    XRefreshStateCanTouchUp,     //手势所处位置，松手可以开始刷新
    XRefreshStateDragEnd,       //松手,开始定位。
    XRefreshStateBack,       //加载完毕开始复位。
    XRefreshStateEnd        //回到原位，整个环节结束。
};

typedef void (^XRefreshHeadle)(void);
//下拉刷新的头视图。
@interface XRefreshView : UIView
{
    NSTimer    * _timer;
}
@property (nonatomic, strong)UILabel   *titleLabel;
@property (nonatomic, strong)UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, copy)XRefreshHeadle xRefreshHeadle;
@property (nonatomic, assign)CGFloat  edgeInsetTop;
@property (nonatomic, assign)XRefreshState    state;
/**
 *  下拉刷新，他判断是否符合返回条件。保证最低停留时间。Yes即将停止加载，再次触发就停止加载。
 */
@property (nonatomic, assign)BOOL    willStop;
/**
 *  判断上拉提示语，是否需要改变，是否可以加载更多。默认NO是可以加载更多。Yes停止加载。
 */
@property (nonatomic, assign)BOOL    noIncreae;
//上面显示标题的数组，和状态相对应。
@property (nonatomic, strong)NSArray     *titleArray;
- (instancetype)initWithIncreaseFrame:(CGRect)frame;
- (void)xRefreshScrollViewOff:(UIScrollView *)scroll;
@end

@interface UIScrollView(XRefresh)

/**
 *  添加下拉刷新的控件
 *
 *  @param autoAdjust   视图中的scrollview是否自动适应了navigation
 *  @param refreshHeadle 下拉刷新需要处理的事件
 */
- (void)addPullDownRefreshViewAutomaticallyAdjustsScrollView:(BOOL)autoAdjust Block:(XRefreshHeadle)refreshHeadle;
/**
 *  上拉加载更多
 *
 *  @param refreshHeadle 上拉后需要处理的事件
 */
- (void)addPullUpRefreshView:(XRefreshHeadle)refreshHeadle;
/**
 *  开始上拉刷新
 */
- (void)startRefresh;
/**
 * 结束下拉刷新。
 */
- (void)stopRefresh;
/**
 *  已经没有更多了，结束上拉增加价更多。
 */
- (void)noIncrease;

@property (nonatomic, strong)XRefreshView  *xheadView;
@property (nonatomic, strong)XRefreshView  *xfootView;
@end

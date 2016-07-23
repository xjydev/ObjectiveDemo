//
//  xRefresh.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 5/23/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

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
@property (nonatomic, strong)UILabel   *titleLabel;
@property (nonatomic, copy)XRefreshHeadle xRefreshHeadle;
@property (nonatomic, assign)CGFloat  edgeInsetTop;
@property (nonatomic, assign)XRefreshState    state;
//上面显示标题的数组，和状态相对应。
@property (nonatomic, strong)NSArray     *titleArray;
- (instancetype)initWithIncreaseFrame:(CGRect)frame;
- (void)xRefreshScrollViewOff:(UIScrollView *)scroll;
@end

@interface UIScrollView(xRefresh)

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
 * 结束上拉刷新。
 */
- (void)stopRefresh;

@property (nonatomic, strong)XRefreshView  *xheadView;
@property (nonatomic, strong)XRefreshView  *xfootView;
@end

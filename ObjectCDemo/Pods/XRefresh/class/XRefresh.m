//
//  XRefresh.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 5/23/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "XRefresh.h"
#import <objc/runtime.h>
CGFloat const refreshHeight = 64;
CGFloat const increaseHeight = 40;
static NSTimeInterval const delayTime = 1;
static NSTimeInterval const animateDurationTime = 0.3;
static char *refreshHeadView = "xheadView";
static char *refreshFootView = "xFootView";
static NSString *const noIncreaseStr = @"没有更多了……";

@implementation XRefreshView
#pragma mark -- 下拉刷新
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArray =@[@"下拉刷新",@"松手刷新",@"刷新中……",@"刷新结束",@"下拉刷新"];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width*0.4, frame.size.height - refreshHeight+(refreshHeight-30)/2, frame.size.width*0.6, 30)];
        [self addSubview:self.titleLabel];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width*0.4 - 44, frame.size.height - refreshHeight+20, 24, 24)];
        [self addSubview:_imageView];
        
        self.state = XRefreshStateEnd;
    }
    return self;
}
- (void)setState:(XRefreshState)state
{
    //没有更多的时候，状态不发生改变。
    if (self.noIncreae) {
        return;
    }
    _state = state;
    self.titleLabel.text = self.titleArray[self.state];
    switch (state) {
        case XRefreshStateEnd:
        {
            
        }
            break;
            
        case XRefreshStateCanTouchUp:
        {
            
        }
            break;
        case XRefreshStateBeganDrag:
        {
            
        }
            break;
            
        case XRefreshStateDragEnd:
        {
            if (self.xRefreshHeadle) {
                self.willStop = NO;
                self.xRefreshHeadle();
            }
            if (!_timer) {
                _timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(refreshAnimation) userInfo:nil repeats:YES];
            }
            
        }
            break;
            
        case XRefreshStateBack:
        {
            if (_timer) {
                [_timer invalidate];
                _timer = nil;
            }
        }
            break;
            
            
        default:
            break;
    }
}
- (void)refreshAnimation{
    static int i = 0;
    i++;
    _imageView.backgroundColor = [UIColor colorWithRed:i%3*0.5 green:(i+1)%3*0.5 blue:(i%2)%3*0.5 alpha:1];
}
- (void)xRefreshScrollViewOff:(UIScrollView *)scroll{
    //手势没有结束前
    if (self.state < XRefreshStateDragEnd) {
        //超过界限就是可以touchup，界线一下就是返回开始拖拽状态。
        if (scroll.contentOffset.y < -self.edgeInsetTop||(scroll.contentOffset.y > scroll.contentSize.height-scroll.bounds.size.height+increaseHeight)) {
            if (self.state!=XRefreshStateCanTouchUp) {
                self.state = XRefreshStateCanTouchUp;
                NSLog(@"==%@",self.titleLabel.text);
            }
        }
        else
        {
            if (self.state!=XRefreshStateBeganDrag) {
                self.state = XRefreshStateBeganDrag;
                NSLog(@"==%@",self.titleLabel.text);
            }
            
        }
    }
}
#pragma mark -- 上拉增加更多
- (instancetype)initWithIncreaseFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArray =@[@"上拉加载更多",@"松手加载",@"加载中……",@"加载结束",@"上拉加载更多"];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor grayColor];
        [self addSubview:self.titleLabel];
        self.state = XRefreshStateEnd;
    }
    return self;
}

@end
@implementation UIScrollView(XRefresh)

@dynamic xfootView;
@dynamic xheadView;

#pragma mark -- 添加下拉刷新
- (void)addPullDownRefreshViewAutomaticallyAdjustsScrollView:(BOOL)autoAdjust Block:(XRefreshHeadle)refreshHeadle
{
    if (!self.xheadView) {
        XRefreshView *view = [[XRefreshView alloc]initWithFrame:CGRectMake(0, -100-refreshHeight, self.bounds.size.width, refreshHeight+100)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        self.xheadView = view;
        self.xheadView.xRefreshHeadle = refreshHeadle;
        
        if (autoAdjust) {
            self.xheadView.edgeInsetTop = 64+refreshHeight;
        }
        else
        {
            self.xheadView.edgeInsetTop = refreshHeight;
        }
        
        [self.panGestureRecognizer addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        
    }
}
- (void)setXheadView:(XRefreshView *)xheadView
{
    [self willChangeValueForKey:@"xheadView"];
    objc_setAssociatedObject(self, refreshHeadView,
                             xheadView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"xheadView"];
    
}
- (XRefreshView *)xheadView
{
    return objc_getAssociatedObject(self, refreshHeadView);
}

#pragma mark -- 添加上拉更多
- (void)addPullUpRefreshView:(XRefreshHeadle)refreshHeadle
{
    if (!self.xfootView) {
        self.contentInset= UIEdgeInsetsMake(self.xheadView.edgeInsetTop - refreshHeight, 0, increaseHeight, 0);
        
        XRefreshView *footView = [[XRefreshView alloc]initWithIncreaseFrame:CGRectMake(0, self.contentSize.height, self.bounds.size.width, increaseHeight) ];
        footView.backgroundColor = [UIColor whiteColor];
        [self addSubview:footView];
        self.xfootView = footView;
        self.xfootView.xRefreshHeadle = refreshHeadle;
        
        [self addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    }
}
- (void)setXfootView:(XRefreshView *)xfootView
{
    [self willChangeValueForKey:@"xfootView"];
    objc_setAssociatedObject(self, refreshFootView,
                             xfootView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"xfootView"];
}
- (XRefreshView *)xfootView{
   return objc_getAssociatedObject(self, refreshFootView);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        NSLog(@"===%@",@(self.contentOffset.y));
        if (self.xheadView && self.contentOffset.y<0) {
          [self.xheadView xRefreshScrollViewOff:self];
        }
        if (self.xfootView&&self.contentOffset.y>(self.contentSize.height - self.frame.size.height)) {
            [self.xfootView xRefreshScrollViewOff:self];
        }
        
    }else if ([keyPath isEqualToString:@"state"])
    {
        if ([change[NSKeyValueChangeOldKey]integerValue] == UIGestureRecognizerStateBegan&&[change[NSKeyValueChangeNewKey]integerValue]==UIGestureRecognizerStateChanged) {
            //开始滑动
            if (self.xheadView) {
               self.xheadView.state = XRefreshStateBeganDrag;
            }
           
            if (self.xfootView) {
                self.xfootView.state = XRefreshStateBeganDrag;
            }
            
        }
        else
            if ([change[NSKeyValueChangeOldKey]integerValue] == UIGestureRecognizerStateChanged&&[change[NSKeyValueChangeNewKey]integerValue]>=UIGestureRecognizerStateEnded) {
                //松开手势
                if (self.contentOffset.y < -self.xheadView.edgeInsetTop) {
                    self.contentInset = UIEdgeInsetsMake(-self.contentOffset.y, 0, self.contentInset.bottom, 0) ;
                    [self startRefresh];
                    
                }
                else
                    if (self.contentOffset.y > self.contentSize.height-self.bounds.size.height+increaseHeight && !self.xfootView.noIncreae) {
                        [self startIncrease];
                    }
                
            }
    }
    else
        if ([keyPath isEqualToString:@"contentSize"]) {
            if (![[change objectForKey:NSKeyValueChangeOldKey ] isEqual:change[NSKeyValueChangeNewKey]]) {
                self.xfootView.frame = CGRectMake(0, self.contentSize.height, self.bounds.size.width, increaseHeight);
            }
        }
}
//加载结束返回原来的位置。
- (void)goBackSite
{
    
    if (self.xheadView.willStop == YES) {
        self.xheadView.state = XRefreshStateBack;
        [UIView animateWithDuration:animateDurationTime animations:^{
            self.contentInset = UIEdgeInsetsMake(self.xheadView.edgeInsetTop - refreshHeight, 0, self.contentInset.bottom, 0);
        }completion:^(BOOL finished) {
            self.xheadView.state = XRefreshStateEnd;
            self.xheadView.willStop = NO;
        }];
    }
    else
    {
        self.xheadView.willStop = YES;
    }
    if (self.xfootView.state != XRefreshStateEnd) {
        self.xfootView.state = XRefreshStateEnd;
    }
    
}

- (void)startRefresh
{
    self.xheadView.state = XRefreshStateDragEnd;
    //如果刷新了界面那么就再次可以加载更多了
    if (self.xfootView) {
        self.xfootView.noIncreae = NO;
    }
    NSLog(@"===%@==%@",@(self.xheadView.state),@(self.contentInset.top));
    [UIView animateWithDuration:0 animations:^{
        self.contentInset = UIEdgeInsetsMake(self.xheadView.edgeInsetTop, 0, self.contentInset.bottom, 0);
    }completion:^(BOOL finished) {
        [self performSelector:@selector(goBackSite) withObject:self.xheadView afterDelay:delayTime];
    }];
    
}
- (void)stopRefresh{
    
    [self goBackSite];
}
- (void)startIncrease
{
    self.xfootView.state = XRefreshStateDragEnd;
    
}
- (void)noIncrease
{
    self.xfootView.noIncreae = YES;
    self.xfootView.titleLabel.text = noIncreaseStr;
}
- (void)dealloc
{

    if (self.xfootView) {
        [self removeObserver:self forKeyPath:@"contentSize"];
    }
    if (self.xheadView) {
        [self removeObserver:self forKeyPath:@"contentOffset"];
        [self.panGestureRecognizer removeObserver:self forKeyPath:@"state"];
    }
    
    
}


@end

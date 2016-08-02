# XRefresh
一个简单的下拉刷新，上拉加载iOS控件。

一句代码集成下拉刷新，

    [self.tableView addPullDownRefreshViewAutomaticallyAdjustsScrollView:NO Block:^{
       
    }];
    
一句代码集成上拉加载更多。

    [self.tableView addPullUpRefreshView:^{
       
    }];
    
可以根据需要自定义下拉刷新的动画

刷新设定下拉最低停留时间，网络请求超出最低时间，按请求时间显示，如果请求过快，按最低时间停留。增强了视觉上的体验。


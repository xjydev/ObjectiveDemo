//
//  xRefresh.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 5/23/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView(xRefresh)

- (void)addPullRefreshView:(void(^)(void))refreshHeadle;
- (void)startRefresh;
- (void)stopRefresh;

@end

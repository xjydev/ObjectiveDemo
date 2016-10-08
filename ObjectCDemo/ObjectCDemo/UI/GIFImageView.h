//
//  GIFImageView.h
//  HomeHelper
//
//  Created by XiaoJingYuan on 7/6/16.
//  Copyright © 2016 DouCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GIFImageView : UIImageView
{
    NSInteger _currentImageIndex;
}
@property (nonatomic, retain) NSArray* imageFrameArray;
@property (nonatomic, retain) NSTimer* timer;
@property (nonatomic) BOOL xAnimating;
@end

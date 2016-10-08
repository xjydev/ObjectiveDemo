//
//  GIFImageView.m
//  HomeHelper
//
//  Created by XiaoJingYuan on 7/6/16.
//  Copyright © 2016 DouCai. All rights reserved.
//

#import "GIFImageView.h"

@implementation GIFImageView
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
}


- (void)setXAnimating:(BOOL)xAnimating
{
    _xAnimating = xAnimating;
    if (xAnimating) {
        
        if (!self.timer) {
          self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(roundCycle) userInfo:nil repeats:YES];
        }
        
    }
    else
    {
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
    }
}


- (void)roundCycle
{
    _currentImageIndex ++;
    self.transform = CGAffineTransformMakeRotation(M_PI/10.0*(_currentImageIndex%10));
}
- (void)tapAction:(id)sender
{
   self.xAnimating = !self.xAnimating;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

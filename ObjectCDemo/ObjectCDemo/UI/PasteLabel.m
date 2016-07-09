//
//  PasteLabel.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 7/4/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "PasteLabel.h"

@implementation PasteLabel
- (void) addPaste{
    self.userInteractionEnabled = YES;
    if (!_longGesture) {
        _longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGestrueAction:)];
        [self addGestureRecognizer:_longGesture];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction)];
        [self addGestureRecognizer:tap];
        
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hiddenChangeBackgroundColor) name:UIMenuControllerWillHideMenuNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showChangeBackgroundColor) name:UIMenuControllerWillShowMenuNotification object:nil];
    }

}
- (void)hiddenChangeBackgroundColor
{
    
    if (self.backgroundColor != [UIColor whiteColor]) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    
}
- (void)showChangeBackgroundColor
{
    if (_longPaste) {
        self.backgroundColor = [UIColor lightGrayColor];
        _longPaste = NO;
    }
    
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copyAction:));
}
- (void)tapGestureAction
{
    if ([UIMenuController sharedMenuController].menuVisible) {
        _longPaste = NO;
        [[UIMenuController sharedMenuController]setMenuVisible:NO animated:YES];
    }
    
}
- (void)longGestrueAction:(UIGestureRecognizer *)gesture
{
    //如果是显示了复制，再次点击就取消了复制。
    if (gesture.state == UIGestureRecognizerStateBegan ) {
        
        [self becomeFirstResponder];
        if (![UIMenuController sharedMenuController].menuVisible) {
            _longPaste = YES;
            UIMenuItem *copyLink = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyAction:)];
            [[UIMenuController sharedMenuController]setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
            [[UIMenuController sharedMenuController]setTargetRect:self.frame inView:self.superview];
            [[UIMenuController sharedMenuController]setMenuVisible:YES animated:YES];
        }
        
    }
}
- (void)copyAction:(id)sender
{
    
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
    
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

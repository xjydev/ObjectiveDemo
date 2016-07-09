//
//  PasteLabel.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 7/4/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PasteLabel : UILabel
{
    UILongPressGestureRecognizer *_longGesture;
    BOOL                   _longPaste;
}
- (void) addPaste;

@end

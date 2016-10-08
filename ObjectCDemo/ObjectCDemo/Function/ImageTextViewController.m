//
//  ImageTextViewController.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 6/7/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "ImageTextViewController.h"
#import "XTextAttachment.h"
//#import "UIImageView+WebCache.h"
#import <CoreText/CoreText.h>
@interface ImageTextViewController ()
{
    NSMutableArray *_mArray;
    NSString    *_keyStr;
    __weak IBOutlet UITextView *_textView;
    __weak IBOutlet UITextField *_textField;
    __weak IBOutlet UILabel *_textLabel;
    
    NSArray   *_smilleTags;
    NSArray   *_smilleImages;
    
}
@end

@implementation ImageTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _smilleTags = @[ @"[/emoji_1]", @"[/emoji_2]", @"[/emoji_3]", @"[/emoji_4]" ];
    _smilleImages = @[ [UIImage imageNamed:@"emoji_1"], [UIImage imageNamed:@"emoji_2"],
                      [UIImage imageNamed:@"emoji_3"], [UIImage imageNamed:@"emoji_4"] ];
    
    
    [self strings];

}

- (IBAction)imageButtonAction:(UIButton *)sender {
    
    XTextAttachment *emojiMent = [XTextAttachment new];
    emojiMent.bounds = CGRectMake(0, 0, 22, 22);
    emojiMent.image = _smilleImages[sender.tag - 300];
    emojiMent.tag = _smilleTags[sender.tag - 300];
    [_textView.textStorage insertAttributedString:[NSAttributedString attributedStringWithAttachment:emojiMent] atIndex:_textView.selectedRange.location];
    _textView.selectedRange = NSMakeRange(_textView.selectedRange.location+1, _textView.selectedRange.length);
    NSRange wholeRange = NSMakeRange(0, _textView.textStorage.length);
    
    [_textView.textStorage removeAttribute:NSFontAttributeName range:wholeRange];

    [_textView.textStorage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:22.0f] range:wholeRange];
    
}

- (IBAction)textToImage:(id)sender {
    
}

- (IBAction)imageToText:(id)sender {
    
    NSMutableString *muStr = [NSMutableString stringWithString:_textView.textStorage.string];
    __block NSInteger base = 0;
    [_textView.textStorage enumerateAttribute:NSAttachmentAttributeName inRange:NSMakeRange(0, _textView.textStorage.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        if ([value isKindOfClass:[XTextAttachment class]]) {
            [muStr replaceCharactersInRange:NSMakeRange(range.location+base, range.length) withString:((XTextAttachment *)value).tag];
            base += ((XTextAttachment *)value).tag.length-1;
        }
    }];
    _textLabel.text = muStr;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)strings {
    NSMutableString *cs =[NSMutableString stringWithString: @"3456"];
    NSString *s = @"6";
    
    if ([cs containsString:s]) {
        NSRange r =[cs rangeOfString:s];
        [cs deleteCharactersInRange:r];
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  QRcodeViewController.m
//  ObjectCDemo
//
//  Created by xiaodev on May/12/17.
//  Copyright © 2017 XiaoJingYuan. All rights reserved.
//

#import "QRcodeViewController.h"

@interface QRcodeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *qRimageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@end

@implementation QRcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    [filter setValue:[@"12345" dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    //4.获取生成的图片
    CIImage *ciImg=filter.outputImage;
    //放大ciImg,默认生产的图片很小
    
    //5.设置二维码的前景色和背景颜色
    CIFilter *colorFilter=[CIFilter filterWithName:@"CIFalseColor"];
    //5.1设置默认值
    [colorFilter setDefaults];
    [colorFilter setValue:ciImg forKey:@"inputImage"];
    [colorFilter setValue:[CIColor colorWithRed:1 green:0 blue:1] forKey:@"inputColor0"];
    [colorFilter setValue:[CIColor colorWithRed:0 green:0 blue:0] forKey:@"inputColor1"];
    //5.3获取生存的图片
    ciImg=colorFilter.outputImage;
    
    CGAffineTransform scale=CGAffineTransformMakeScale(10, 10);
    ciImg=[ciImg imageByApplyingTransform:scale];
    
    //6.在中心增加一张图片
    UIImage *img=[UIImage imageWithCIImage:ciImg];
    
    //7.生存图片
    CGFloat width = 480;
    CGFloat height = 480;
    
    //7.1开启图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    //7.2将二维码的图片画入
    //BSXPCMessage received error for message: Connection interrupted   why??
    //    [img drawInRect:CGRectMake(10, 10, img.size.width-20, img.size.height-20)];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, width, height)];
    [[UIColor redColor] setFill];
    [path fill];
    [img drawInRect:CGRectMake(0, 0,width , height)];
    //7.3在中心划入其他图片
//    if (_centerImage) {
//        CGFloat centerW=width/3;
//        CGFloat centerH=height/3;
//        CGFloat centerX=(width-centerW)*0.5;
//        CGFloat centerY=(height -centerH)*0.5;
//        
//        [_centerImage drawInRect:CGRectMake(centerX, centerY, centerW, centerH)];
//        
//    }
    
    //7.4获取绘制好的图片
    _qRimageView.image =UIGraphicsGetImageFromCurrentImageContext();
    
    //7.5关闭图像上下文
    UIGraphicsEndImageContext();

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _qRimageView.backgroundColor = [UIColor redColor];
    _qRimageView.layer.masksToBounds = 5;
    _qRimageView.layer.borderColor = [UIColor blueColor].CGColor;
    _qRimageView.layer.borderWidth = 4.0;
    
    UIGraphicsBeginImageContextWithOptions(_qRimageView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [_qRimageView.layer renderInContext:ctx];
    _secondImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

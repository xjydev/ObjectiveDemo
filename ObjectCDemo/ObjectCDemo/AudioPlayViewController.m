//
//  AudioPlayViewController.m
//  ObjectCDemo
//
//  Created by xiaodev on Nov/30/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "AudioPlayViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface AudioPlayViewController ()
{
    AVPlayer *_player;
}
/**
 *  控制视频播放的控件
 */
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
/**
 *  声明播放视频的控件属性[既可以播放视频也可以播放音频]
 */
@property (nonatomic,strong)AVPlayer *player;
/**
 *  播放的总时长
 */
@property (nonatomic,assign)CGFloat sumPlayOperation;@end

@implementation AudioPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *urlStr = @"http://photo.res.ehuanxin.com/supply/lingqiyayu-1%E6%88%90%E5%93%81.mp3";
//    NSURL *url = [NSURL URLWithString:urlStr];
//    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:url];
//    AVPlayer *player = [[AVPlayer alloc]initWithPlayerItem:item];
//    player.volume = 1.0;
//    [player play];
    
    
    
    
    //http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4
    NSString *playString = @"http://photo.res.ehuanxin.com/supply/lingqiyayu-1%E6%88%90%E5%93%81.mp3";
    NSURL *url = [NSURL URLWithString:playString];
    //设置播放的项目
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    //初始化player对象
    self.player = [[AVPlayer alloc] initWithPlayerItem:item];
//    设置播放页面
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:_player];
    //设置播放页面的大小
    layer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置播放窗口和当前视图之间的比例显示内容
    layer.videoGravity = AVLayerVideoGravityResizeAspect;
    //添加播放视图到self.view
    [self.view.layer addSublayer:layer];
    //设置播放进度的默认值
    self.progressSlider.value = 0;
    //设置播放的默认音量值
    self.player.volume = 1.0f;
    [self.player play];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.player play];
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

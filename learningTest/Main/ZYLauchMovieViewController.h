//
//  ZYLauchMovieViewController.h
//  learningTest
//
//  Created by Apple on 2019/1/17.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZYLauchMovieViewController : AVPlayerViewController


/** 播放开始之前的图片 */
@property (nonatomic , strong)UIImageView *startPlayerImageView;
/** 播放中断时的图片 */
@property (nonatomic , strong)UIImageView *pausePlayerImageView;
/** 定时器 */
@property (nonatomic , strong)NSTimer *timer;
/** 结束按钮 */
@property (nonatomic , strong)UIButton *enterMainButton;

@end

NS_ASSUME_NONNULL_END

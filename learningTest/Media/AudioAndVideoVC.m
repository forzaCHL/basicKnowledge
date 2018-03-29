//
//  AudioAndVideoVC.m
//  learningTest
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AudioAndVideoVC.h"


@interface AudioAndVideoVC ()

@end

@implementation AudioAndVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Audio And Video Play";
    [self setUpUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(void)setUpUI
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton *playerbtn1 = [[UIButton alloc]init];
    playerbtn1.frame =CGRectMake([UIScreen mainScreen].bounds.size.width * 0.5 - 50, [UIScreen mainScreen].bounds.size.height * 0.5 - 50, 100, 100);
    playerbtn1.backgroundColor = [UIColor grayColor];
    [playerbtn1 setTitle:@"点播视频" forState:UIControlStateNormal];
    [playerbtn1 addTarget:self action:@selector(playerBtnClick1) forControlEvents:UIControlEventTouchUpInside];
    playerbtn1.titleLabel.numberOfLines = 0;
    playerbtn1.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:playerbtn1];
    
    UIButton *playerbtn2 = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 0.75 - 50, [UIScreen mainScreen].bounds.size.height * 0.5 - 50, 100, 100)];
    playerbtn2.backgroundColor = [UIColor grayColor];
    [playerbtn2 setTitle:@"直播视频" forState:UIControlStateNormal];
    [playerbtn2 addTarget:self action:@selector(playerBtnClick2) forControlEvents:UIControlEventTouchUpInside];
    playerbtn2.titleLabel.numberOfLines = 0;
    playerbtn2.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:playerbtn2];
    self.navigationItem.title = @"播放器（测试使用）";
    
}
-(void)playerBtnClick1
{
   
}
-(void)playerBtnClick2
{
    
}

@end

//
//  BannerViewController.m
//  learningTest
//
//  Created by Apple on 2018/4/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BannerViewController.h"
#import "BannerView.h"

@interface BannerViewController ()

@property(nonatomic,strong)BannerView *bannerView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Banner";
    NSArray *data = [[NSArray alloc]initWithObjects:@"u51",@"u35",@"u29",@"tu1",@"tu2",@"tu3", nil];
    self.bannerView = [[BannerView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 200) dataArray:data];
    [self.view addSubview:self.bannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

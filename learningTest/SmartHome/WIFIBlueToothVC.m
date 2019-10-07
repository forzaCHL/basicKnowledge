//
//  WIFIBlueToothVC.m
//  learningTest
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "WIFIBlueToothVC.h"
#import "GCDAsyncSocket.h"

#import "GCDAsyncSocketManager.h"

#import "ZXYBaseSegmentControl.h"
#import "KvokvcVC.h"
#import "RuntimeVC.h"



static NSString *host = @"192.168.0.2";
static int port = 8888;

@interface WIFIBlueToothVC ()<BaseSegmentControlDelegate>

@property (weak, nonatomic) UIView *currentView;

@property (weak, nonatomic) ZXYBaseSegmentControl *segmentControl;

@property(nonatomic,strong)GCDAsyncSocketManager *socketManger;

@end

@implementation WIFIBlueToothVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Interesting";
    [self setUpSocket];
    [self addChildVC];
//    [self setupTopTabbar];
}
#pragma mark ----------- Socket{
-(void)setUpSocket{
    self.socketManger = [GCDAsyncSocketManager sharedInstance];
    //创建之后不会再继续调用init方法
    GCDAsyncSocketManager *manger = [GCDAsyncSocketManager sharedInstance];
    
    
    [self.socketManger changeHost:host port:port];
    [self.socketManger connectSocketWithDelegate:self];
}
- (void)addChildVC {

    KvokvcVC * unfinishedVC = [KvokvcVC new];
    
    RuntimeVC * finishedVC = [RuntimeVC new];
    [self addChildViewController:unfinishedVC];
    [self addChildViewController:finishedVC];
}

- (void)setupTopTabbar {
    ZXYBaseSegmentControl *segmentControl = [[ZXYBaseSegmentControl alloc] init];
    segmentControl.delegate = self;
    segmentControl.titlesArray = @[@"KVO&KVC",@"Runtime"];
    segmentControl.defaultSelected = 0;
    [self.view addSubview:segmentControl];
    self.segmentControl = segmentControl;
    [segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
        make.height.equalTo(@(42));
    }];
    
    [segmentControl createView];
}

- (void)segmentControlWithButtonClickIndex:(NSUInteger)index
{
    [self.currentView removeFromSuperview];
    UIViewController *vc = self.childViewControllers[index];
    [self.view addSubview:vc.view];
    self.currentView = vc.view;
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentControl.mas_bottom).offset(2.5);
        make.left.right.bottom.equalTo(self.view);
    }];
}
-(void)socket{
//    CFSocketRef
}
@end

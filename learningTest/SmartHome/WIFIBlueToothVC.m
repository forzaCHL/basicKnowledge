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

static NSString *host = @"192.168.0.2";
static int port = 8888;
@interface WIFIBlueToothVC ()

@property(nonatomic,strong)GCDAsyncSocketManager *socketManger;

@end

@implementation WIFIBlueToothVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Interesting";
    [self setUpSocket];
}
#pragma mark ----------- Socket{
-(void)setUpSocket{
    self.socketManger = [GCDAsyncSocketManager sharedInstance];
    [self.socketManger changeHost:host port:port];
    [self.socketManger connectSocketWithDelegate:self];
}
@end

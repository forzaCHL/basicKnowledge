//
//  AppPushViewController.m
//  learningTest
//
//  Created by Apple on 2018/1/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AppPushViewController.h"

@interface AppPushViewController ()

@end

@implementation AppPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(20, 100, 80, 40);
    [but setTitle:@"跳转APP" forState: UIControlStateNormal];
    but.backgroundColor = [UIColor greenColor];
    [but addTarget:self action:@selector(pushApp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];


    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(20, 200, 80, 40);
    [but2 setTitle:@"跳转APPStore" forState: UIControlStateNormal];
    but2.backgroundColor = [UIColor greenColor];
    [but2 addTarget:self action:@selector(pushAPPstore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    UIButton *but3 = [UIButton buttonWithType:UIButtonTypeCustom];
    but3.frame = CGRectMake(20, 300, 80, 40);
    [but3 setTitle:@"获取URL" forState: UIControlStateNormal];
    but3.backgroundColor = [UIColor greenColor];
    [but3 addTarget:self action:@selector(getURL) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but3];
}
#pragma mark ----------- 直接打开
-(void)pushApp{
    // 1.获取应用程序App-B的URL Scheme
    NSURL *appBUrl = [NSURL URLWithString:@"partyyddj:"];
    // 2.判断手机中是否安装了对应程序
    if ([[UIApplication sharedApplication] canOpenURL:appBUrl]) {
        // 3. 打开应用程序App-B
        if (@available(iOS 10.0, *)) {
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"partyyddj://params?url=http://zjoa.com&userId=fw12ea2754dba"]];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"partyyddj://com.cmcc.dangjian?jumpFrom=zjOA?url=http://zjoa.com&userId=panyupeng"]];
            
            
            
            
            
        } else {
            // Fallback on earlier versions
        }
    } else {
        NSLog(@"没有安装");
    }
}
#pragma mark ----------- 跳转苹果商店
-(void)pushAPPstore{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/jie-zou-da-shi/id493901993?mt=8"]];
}
-(void)getURL{
    NSDictionary *dic= [[[NSBundle mainBundle] infoDictionary] objectForKey:@"LSApplicationQueriesSchemes"];
    NSLog(@"dic %@",dic);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

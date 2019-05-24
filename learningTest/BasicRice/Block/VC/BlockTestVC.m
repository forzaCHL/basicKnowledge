//
//  BlockTestVC.m
//  learningTest
//
//  Created by Apple on 2017/11/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BlockTestVC.h"
#import "ViewControllerI.h"
#import "setProtocoll.h"
@interface BlockTestVC ()<Protocol,setProtocoll>

@end

@implementation BlockTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self norMalBlock];
//    [self useWithTypedef];
    [self creatButton];
    
    //遵守了protocal 就拥有了protocol声明的方法
    [self setEat];
    [self setDrink];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nsObserver:) name:@"ns1" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nsObserver2:) name:@"ns2" object:nil];
    
}
- (void)setEat{
    NSLog(@"setEat");
}
- (void)setDrink{
    NSLog(@"setDrink");
}
-(void)creatButton{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(20, 100, 55, 40);
    but.backgroundColor = [UIColor orangeColor];
    [but addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
-(void)pushVC{
    
    ViewControllerI *vc = [ViewControllerI new];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    //属性
    vc.strBlock = ^(NSString *str) {
        NSLog(@"str -->%@",str);
    };
    vc.BlockII = ^(NSString *str) {
        NSLog(@"str -->%@",str);
    };
    //方法参数
    [vc blckmtthod];
    
    [vc blockinfo:^(NSString *str) {
        NSLog(@"blockinfostr-->%@",str);
    }];
    
    [vc showblock:^(NSString * showmsg) {
        NSLog(@"showblock-->%@",showmsg);
    }];
    
    [ViewControllerI blockclass:^(NSString *str) {
        NSLog(@"blockclassstr-->%@",str);
    }];
    
    
    vc.showblockii(200);
    
}
#pragma mark ----------- 代理
- (void)setProtocol:(NSString *)parm{
    NSLog(@"pra %@",parm);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)norMalBlock{
    void (^normalBlock)(void)=^{
        NSLog(@"normalBlock 无参数,无返回值的block");
    };
    normalBlock();
    
    void (^normalBlockI)(int a,int b) = ^(int a,int b){
        NSLog(@"传入参数无返回值 %d",a+b);
        self.text = @"123";
    };
    normalBlockI(3,4);
    
    int (^normalBlockII)(int a,int b) = ^(int a,int b){
        return a+b;
    };
    int sum = normalBlockII(3,4);
    NSLog(@"有参数有返回值 %d",sum);
}
#pragma mark ----------- block结合typedef使用
-(void)useWithTypedef{
    self.sumBlock = ^int(int a, int b) {
        return a+b;
    };
    NSLog(@"useWithTypedef-->%d",_sumBlock(3,4));
}
#pragma mark -----------通知
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ns1" object:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ns2" object:nil userInfo:@{@"name":@"cxk"}];
}
-(void)nsObserver:(NSNotification *)info{
    NSDictionary *dic = info.userInfo;
    NSLog(@"nsdic %@",dic);
}
-(void)nsObserver2:(NSNotification *)info{
    NSDictionary *dic = info.userInfo;
    NSLog(@"ns2dic %@",dic);
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //先
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ns1" object:nil];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //后
}
@end

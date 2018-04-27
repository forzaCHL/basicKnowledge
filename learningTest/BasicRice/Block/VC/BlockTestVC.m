//
//  BlockTestVC.m
//  learningTest
//
//  Created by Apple on 2017/11/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BlockTestVC.h"
#import "ViewControllerI.h"

@interface BlockTestVC ()

@end

@implementation BlockTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self norMalBlock];
//    [self useWithTypedef];
    [self creatButton];
    
    
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
    [self.navigationController pushViewController:vc animated:YES];
    vc.strBlock = ^(NSString *str) {
        NSLog(@"str -->%@",str);
    };
    vc.BlockII = ^(NSString *str) {
        NSLog(@"blockII");
    };
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)norMalBlock{
    void (^normalBlock)()=^{
        NSLog(@"normalBlock 无参数,无返回值的block");
    };
    normalBlock();
    
    void (^normalBlockI)(int a,int b) = ^(int a,int b){
        NSLog(@"传入参数无返回值 %d",a+b);
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
@end

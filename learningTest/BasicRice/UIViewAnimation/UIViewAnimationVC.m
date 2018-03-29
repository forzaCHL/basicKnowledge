//
//  UIViewAnimationVC.m
//  learningTest
//
//  Created by Apple on 2018/3/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIViewAnimationVC.h"

@interface UIViewAnimationVC ()

@end

@implementation UIViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Animation";
    self.view.backgroundColor = [UIColor whiteColor];
    [self tweenedAnimation];
}
#pragma mark ----------- 渐变动画
-(void)tweenedAnimation{
//    [self TranslateAnimation];//1.1 位移动画
    [self scaleView];//缩放动画
}
#pragma mark ----------- 1.1 位移动画：改变控件的X，Y位置
-(void)TranslateAnimation{
//1.1步骤式代码
    UIView *viewI = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
    viewI.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewI];
    
//    1.1.1 开始动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    
// 1.1.2.动画执行的代码
    CGRect frame = viewI.frame;
    frame.origin.y += 100;
    viewI.frame = frame;
    
// 1.1.3.提交动画
    [UIView commitAnimations];
    
//1.2 block
    UIView *viewII = [[UIView alloc]initWithFrame:CGRectMake(130, 100, 100, 100)];
    viewII.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewII];
//    block 1
//    [UIView animateWithDuration:1.0 animations:^{
//        CGRect frame = viewII.frame;
//        frame.origin.y += 100;
//        viewII.frame = frame;
//    }];
//    block 2
    [UIView animateWithDuration:1.0 animations:^{
        CGRect frame = viewII.frame;
        frame.origin.y += 100;
        viewII.frame = frame;
    } completion:^(BOOL finished) {
        viewII.backgroundColor = [UIColor orangeColor];
    }];
//    有delay延时和option设置的动画方法
    UIView *viewIII = [[UIView alloc]initWithFrame:CGRectMake(240, 100, 100, 100)];
    viewIII.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewIII];
    [UIView animateKeyframesWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = viewIII.frame;
        frame.origin.y += 100;
        viewIII.frame = frame;
    } completion:^(BOOL finished) {
        viewIII.backgroundColor = [UIColor orangeColor];
    }];
    /*
     UIViewAnimationOptionCurveEaseInOut            开始动画/结束动画-->比较缓慢
     UIViewAnimationOptionCurveEaseIn               开始动画-->比较缓
     UIViewAnimationOptionCurveEaseOut              结束动画-->比较缓慢
     UIViewAnimationOptionCurveLinear               线性-->匀速
     */
}
#pragma mark ----------- 1.2缩放动画
-(void)scaleView{
    UIView *viewII = [[UIView alloc]initWithFrame:CGRectMake(130, 100, 100, 100)];
    viewII.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewII];
    [UIView animateWithDuration:1.0 animations:^{
        CGRect frame = viewII.frame;
        frame.size.width += 100;
        frame.size.height += 100;
        viewII.frame = frame;
    } completion:^(BOOL finished) {
        viewII.backgroundColor = [UIColor orangeColor];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

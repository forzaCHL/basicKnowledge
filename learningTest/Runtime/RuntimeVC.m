//
//  RuntimeVC.m
//  learningTest
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//  my snowman and me

#import "RuntimeVC.h"
#import "TestVC.h"
#import <objc/message.h>
#import <objc/runtime.h>
//#import <objc/message.h>
//#import<objc/runtime.h>

@interface RuntimeVC ()

@end

@implementation RuntimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

//    [self performSelector];
    [self addProperty];
}
#pragma mark ----------- 发送消息
-(void)sendMsg{
    TestVC *vc = [[TestVC alloc]init];
    //    1 sendMsg
    ((void (*) (id, SEL)) (void *)objc_msgSend)(vc, sel_registerName("testRuntime"));
    ((void (*) (id, SEL)) (void *)objc_msgSend)(vc,@selector(testRuntimeII:));
}
#pragma mark ----------- 动态添加方法
-(void)performSelector{
    TestVC *vc = [[TestVC alloc]init];
    //    2 动态添加方法
    // 默认TestVC，没有实现testRuntime方法，可以通过performSelector调用，但是会报错。
    [vc performSelector:@selector(testRuntimeII:) withObject:@"23444"];
    
    // 动态添加方法就不会报错 没有此方法的声明  实现闪退
//    [vc performSelector:@selector(testRuntimesss)];
    
//    可以添加一个.h文件没有声明  .m文件实现了的方法
    [vc performSelector:@selector(testRuntimeIII)];
}
#pragma mark ----------- 添加属性
-(void)addProperty{
    TestVC *vc = [[TestVC alloc]init];
    NSLog(@"1->vc.testString%@",vc.testString);
    vc.testString = @"赋值之后有了吧";
    NSLog(@"2->vc.testString%@",vc.testString);
}
#pragma mark ----------- 字典转模型

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end

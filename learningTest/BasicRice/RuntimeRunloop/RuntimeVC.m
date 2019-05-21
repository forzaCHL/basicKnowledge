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

#import "TestClass.h"
#import "TestClass+Category.h"
#import "TestClass+SwapMethod.h"
#import "TestClass+AssociatedObject.h"
#import "RuntimeKit.h"


@interface RuntimeVC ()

@end

@implementation RuntimeVC

#pragma mark ----------- 输出类名
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"%@ will appear", className);
//    [self performSelector];
    [self addProperty];
    
//    [self methodFromGithub];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self sendMsg];
}
#pragma mark ----------- 发送消息
-(void)sendMsg{
    TestVC *vc = [[TestVC alloc]init];
    //    1 sendMsg
//    1.不带参数的方法被编译为：objc_msgSend(receiver，selector)
//    2.带参数的方法被编译为：objc_msgSend(recevier，selector，org1，org2，…)
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

#pragma mark ----------- 摘自github demo的一些用法
-(void)methodFromGithub{
    NSString *className = [RuntimeKit fetchClassName:[TestClass class]];
    NSLog(@"测试类的类名为：%@\n", className);
    
    NSArray *ivarList = [RuntimeKit fetchIvarList:[TestClass class]];
    NSLog(@"\n获取TestClass的成员变量列表:%@", ivarList);
    
    NSArray *propertyList = [RuntimeKit fetchPropertyList:[TestClass class]];
    NSLog(@"\n获取TestClass的属性列表:%@", propertyList);
    
    NSArray *methodList = [RuntimeKit fetchMethodList:[TestClass class]];
    NSLog(@"\n获取TestClass的方法列表：%@", methodList);
    
    NSArray *protocolList = [RuntimeKit fetchProtocolList:[TestClass class]];
    NSLog(@"\n获取TestClass的协议列表：%@", protocolList);
    TestClass *instance = [TestClass new];
    [instance publicTestMethod2];
    [instance performSelector:@selector(noThisMethod:) withObject:@"实例方法参数"];
    
    instance.dynamicAddProperty = @"我是动态添加的属性";
    NSLog(@"%@", instance.dynamicAddProperty);
    
    
    [instance swapMethod];
    [instance method1];
}
@end

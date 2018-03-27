//
//  AssertVC.m
//  learningTest
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AssertVC.h"
#import "MyAssertHandler.h"

@interface AssertVC ()

@end

@implementation AssertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSAssertionHandler *myHandler = [[MyAssertHandler alloc] init];
    //给当前的线程
    [[[NSThread currentThread] threadDictionary] setValue:myHandler
                                                   forKey:NSAssertionHandlerKey];
    
    [self assert];
//    [self parameterAssert:nil];//nil 闪退  @""不闪退
}
#pragma mark ----------- NSCAssert
-(void)assert{
    /**
     NSAssert()是一个宏，用于开发阶段调试程序中的Bug，通过为NSAssert()传递条件表达式来断定是否属于Bug，满足条件返回真值，程序继续运行，如果返回假值，则抛出异常，并且可以自定义异常描述。
     
     NSAssert()是这样定义的：
     #define NSAssert(condition, desc)
     condition是条件表达式，值为YES或NO；desc为异常描述，通常为NSString。当conditon为YES时程序继续运行，为NO时，则抛出带有desc描述的异常信息。NSAssert()可以出现在程序的任何一个位置。
     */
    int a = 1;
    NSCAssert(a == 2, @"a must equal to 2"); //第一个参数是条件,如果第一个参数不满足条件,就会记录并打印后面的字符串
    
    NSAssert(NO, @"00-0-0-0");
}
#pragma mark ----------- NSParameterAssert
-(void)parameterAssert:(NSString *)str{
    //只需要一个参数,如果参数存在程序继续运行,如果参数为空,则程序停止打印日志
    NSParameterAssert(str);
    
}
#pragma mark ----------- NSAssertionHandler
-(void)assertTionHandler{
    /**
     NSAssertionHandler实例是自动创建的，用于处理错误断言。如果 NSAssert和NSCAssert条件评估为错误，会向 NSAssertionHandler实例发送一个表示错误的字符串。每个线程都有它自己的NSAssertionHandler实例。
     */
}
@end

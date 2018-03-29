//
//  TestVC.h
//  learningTest
//
//  Created by Apple on 2017/10/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestVC : UIViewController

//@property(nonatomic,strong)Helper *helper;

//测试runtime成员变量 方法
@property(nonatomic,strong)NSString *testString;

-(void)testRuntime;
-(void)testRuntimeII:(NSString *)str;
-(void)testRuntimesss;//声明不去实现

@end

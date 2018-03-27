//
//  TestVC.m
//  learningTest
//
//  Created by Apple on 2017/10/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TestVC.h"
#import "Helper.h"

@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    BOOL pwd=[Helper justPassword:@"12qww"];
    NSLog(@"pwd=%d",pwd);
    
}
-(void)testRuntime{
    NSLog(@"testRuntime method");
}
-(void)testRuntimeII:(NSString *)str{
    NSLog(@"testRuntime methodII00000---%@",str);
}
-(void)testRuntimeIII{
    NSLog(@"没有声明的方法");
}
@end

//
//  OCCallJSViewController.m
//  learningTest
//
//  Created by Apple on 2019/1/26.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "OCCallJSViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface OCCallJSViewController ()

@property(nonatomic,strong)UILabel *showLable;

@property(nonatomic,strong)UITextField *textField;

@property (strong, nonatomic) JSContext *context;

@end

@implementation OCCallJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"oc call js";
    self.context = [[JSContext alloc] init];
    [self.context evaluateScript:[self loadJsFile:@"test"]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 170, 300, 40)];
    self.textField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.textField];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 250, 100, 40);
    [but setTitle:@"交给js计算阶乘" forState:UIControlStateNormal];
    but.titleLabel.textColor = [UIColor blackColor];
    [but addTarget:self action:@selector(compute) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 100, 40)];
    lab.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab];
    self.showLable = lab;
}

- (NSString *)loadJsFile:(NSString*)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"js"];
    NSString *jsScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return jsScript;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)compute{
    NSNumber *inputNumber = [NSNumber numberWithInteger:[self.textField.text integerValue]];
    JSValue *function = [self.context objectForKeyedSubscript:@"factorial"];
    JSValue *result = [function callWithArguments:@[inputNumber]];
    self.showLable.text = [NSString stringWithFormat:@"%@", [result toNumber]];
}

@end

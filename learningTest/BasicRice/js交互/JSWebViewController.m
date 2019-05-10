//
//  JSWebViewController.m
//  learningTest
//
//  Created by Apple on 2019/1/26.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "JSWebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface JSWebViewController ()

@end

@implementation JSWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"js call oc";
    self.mWebView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    self.mWebView.delegate = self;
    self.mWebView.multipleTouchEnabled = YES;
    self.mWebView.scalesPageToFit = YES;
//    NSURL *url = [NSURL URLWithString:@"http://vwtrainingtest.faw-vw.com/app"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.mWebView loadRequest:request];
    
    
    NSString *path = [[[NSBundle mainBundle] bundlePath]  stringByAppendingPathComponent:@"JSCallOC.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.mWebView loadRequest:request];
    
    [self.view addSubview:self.mWebView];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 以 html title 设置 导航栏 title
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    // 禁用 页面元素选择
    //[webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    
    // 禁用 长按弹出ActionSheet
    //[webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
    // Undocumented access to UIWebView's JSContext
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    // 打印异常
    self.context.exceptionHandler =
    ^(JSContext *context, JSValue *exceptionValue)
    {
        context.exception = exceptionValue;
        NSLog(@"%@", exceptionValue);
    };
    
    // 以 JSExport 协议关联 native 的方法
    self.context[@"native"] = self;
    
    // 以 block 形式关联 JavaScript function
    self.context[@"log"] =
    ^(NSString *str)
    {
        NSLog(@"%@", str);
    };
    
    // 以 block 形式关联 JavaScript function
//    <input type="button" value="oc原生Alert" onclick="alertClick('alert');" />
    self.context[@"alertClick"] =
    ^(NSString *str,NSString *str2)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:str2 message:str delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    };
    
    __block typeof(self) weakSelf = self;
    self.context[@"addSubView"] =
    ^(NSString *viewname)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 500, 300, 100)];
        view.backgroundColor = [UIColor redColor];
        UISwitch *sw = [[UISwitch alloc]init];
        [view addSubview:sw];
        [weakSelf.view addSubview:view];
    };
    //多参数
    self.context[@"mutiParams"] =
    ^(NSString *a,NSString *b,NSString *c)
    {
        NSLog(@"%@ %@ %@",a,b,c);
    };
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

-(void)dealloc
{
    [_mWebView removeFromSuperview];
    _mWebView = nil;
}
#pragma mark - JSExport Methods

- (void)handleFactorialCalculateWithNumber:(NSNumber *)number
{
    NSLog(@"%@", number);
    
    NSNumber *result = [self calculateFactorialOfNumber:number];
    
    NSLog(@"%@", result);
    
    [self.context[@"showResult"] callWithArguments:@[result]];
}

- (void)pushViewController:(NSString *)view title:(NSString *)title
{
    Class second = NSClassFromString(view);
    id secondVC = [[second alloc]init];
    ((UIViewController*)secondVC).title = title;
    [self.navigationController pushViewController:secondVC animated:YES];
}

#pragma mark - Factorial Method

- (NSNumber *)calculateFactorialOfNumber:(NSNumber *)number
{
    NSInteger i = [number integerValue];
    if (i < 0)
    {
        return [NSNumber numberWithInteger:0];
    }
    if (i == 0)
    {
        return [NSNumber numberWithInteger:1];
    }
    
    NSInteger r = (i * [(NSNumber *)[self calculateFactorialOfNumber:[NSNumber numberWithInteger:(i - 1)]] integerValue]);
    
    return [NSNumber numberWithInteger:r];
}

@end

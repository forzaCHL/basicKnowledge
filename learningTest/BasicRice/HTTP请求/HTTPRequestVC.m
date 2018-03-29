//
//  HTTPRequestVC.m
//  learningTest
//
//  Created by Apple on 2018/1/16.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HTTPRequestVC.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
@interface HTTPRequestVC ()<NSURLSessionDataDelegate>

@end

@implementation HTTPRequestVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self headMethod];
    [self NewRequest];
    
}
-(void)getMethod{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger GET:@"https://www.baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"suc");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail");
    }];

}
-(void)headMethod{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger HEAD:@"https://www.baidu.com" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task) {
        NSLog(@"task %@",task);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail");
    }];
}
/**
 
 1    GET    请求指定的页面信息，并返回实体主体。
 2    HEAD    类似于get请求，只不过返回的响应中没有具体的内容，用于获取报头
 3    POST    向指定资源提交数据进行处理请求（例如提交表单或者上传文件）。数据被包含在请求体中。      POST请求可能会导致新的资源的建立和/或已有资源的修改。
 4    PUT    从客户端向服务器传送的数据取代指定的文档的内容。
 5    DELETE    请求服务器删除指定的页面。
 6    CONNECT    HTTP/1.1协议中预留给能够将连接改为管道方式的代理服务器。
 7    OPTIONS    允许客户端查看服务器的性能。
 8    TRACE    回显服务器收到的请求，主要用于测试或诊断。
 
 */

#pragma mark ----------- NSURLSession
-(void)NewRequest{
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
//   get 1
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"get1---respon---%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    [task resume];//执行
//   get 2
    NSURLSessionTask *taskII = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         NSLog(@"get2---respon---%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    [taskII resume];
//   post NSURLSessionDataTask
    NSURL *urlI = [NSURL URLWithString:@"http://120.25.226.186:32812/login"];
    NSMutableURLRequest *requestI = [NSMutableURLRequest requestWithURL:urlI];
    requestI.HTTPMethod = @"POST";
    NSDictionary *dic = @{
        @"username":@"520it",
        @"pwd":@"520it",
        @"type":@"JSON"
    };
    NSString *json = [self dictionaryToJson:dic];
    requestI.HTTPBody = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"post---%@",[NSThread currentThread]);
        NSLog(@"post---%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    [dataTask resume];
//   代理
    NSURL *urls = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=123&pwd=123&type=JSON"];
    
    //2.创建请求对象
    NSURLRequest *requests = [NSURLRequest requestWithURL:urls];
    
    //3.创建会话对象,设置代理
    /*
     第一个参数:配置信息 [NSURLSessionConfiguration defaultSessionConfiguration]
     第二个参数:代理
     第三个参数:设置代理方法在哪个线程中调用
     */
    NSURLSession *sessions = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    //4.创建Task
    NSURLSessionDataTask *dataTasks = [sessions dataTaskWithRequest:requests];
    
    //5.执行Task
    [dataTasks resume];
    
    
}
- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
#pragma mark -----------1.接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler{
    NSLog(@"delegate res---%@",response);
}
#pragma mark -----------2.接收到服务器返回数据
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data{
    NSLog(@"delegate data---%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
}
@end

//
//  GCDVC.m
//  learningTest
//
//  Created by Apple on 2017/10/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "GCDVC.h"
#import "ViewController1.h"
@interface GCDVC ()


@property(nonatomic,assign)int testvalue;

@end

@implementation GCDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testvalue = 0;
    self.view.backgroundColor = [UIColor whiteColor];
//    [self testGCDGroup3];
//    [self testSemaphore];
    [self ybbf];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:)name:@"tongzhi" object:nil];
    UILabel *lab = [UILabel new];
    
    
}
- (void)tongzhi:(NSNotification *)text{
    
    NSLog(@"%@",text.userInfo[@"textOne"]);
    
    NSLog(@"－－－－－接收到通知------");
    
}
#pragma mark ----------- 并发队列
#pragma mark ----------- 每次想执行10个任务。休息两秒。继续执行10个任务。可以这么写.
-(void) testSemaphore{
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10); //信号总量是10
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 30; i++)
    {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//信号量-1
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            dispatch_semaphore_signal(semaphore);   //信号量＋1
        });
    }
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}
#pragma mark -----------  dispatch_group_t,dispatch_group_notify
#pragma mark -----------  多任务 结束刷新UI  需要在主线程中执行，比如操作GUI，那么我们只要将main queue而非全局队列传给dispatch_group_notify函数就行了。
-(void) testGCDGroup3{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"group1");
        [self vauleChange:@"1"];
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"group2");
        [self vauleChange:@"2"];
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"group3");
        [self vauleChange:@"3"];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"testGCDGroup3 更新UI操作");
        NSLog(@"lll-%d",self.testvalue);
    });
}
#pragma mark ----------- 耗时任务放在子线程
-(void)needmuchtime{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 处理耗时操作在此次添加
        
        //通知主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            //在主线程刷新UI
        });
        
    });
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController1 *vc = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)vauleChange:(NSString *)tag{
    for (int i = 0; i<10; i++) {
        self.testvalue ++;
        NSLog(@"tag %@  value %d",tag,self.testvalue);
    }
}
#pragma mark ----------- 异步并发
-(void)ybbf{
        //获取全局并发队列
        dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //2.添加任务到队列中，就可以执行任务
        dispatch_async(queue, ^{
              [self vauleChange:@"1"];
               });
        dispatch_async(queue, ^{
              [self vauleChange:@"2"];
                   });
        dispatch_async(queue, ^{
               [self vauleChange:@"3"];
                });
        //打印主线程
        NSLog(@"主线程----%@  vale--%d",[NSThread mainThread],self.testvalue);
}

@end

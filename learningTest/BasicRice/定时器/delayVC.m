//
//  delayVC.m
//  learningTest
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "delayVC.h"

@interface delayVC ()

@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)int timeCount;
@end

@implementation delayVC

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.timeCount = 0;
//    [self performSele];
//    [self dispathAfter];
//    [self nstimer];
    [self timerWithdispatchQueue];
}
#pragma mark ----------- 1 performSelector
-(void)performSele{
    [self performSelector:@selector(firstLog) withObject:self afterDelay:3];
}
-(void)firstLog{
    NSLog(@"firstLog performSelector");
}

#pragma mark ----------- 2 线程派发 dispatch_after
-(void)dispathAfter{
    // 3秒钟之后执行 block
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"dispatch_after");
    });
}


#pragma mark ----------- 3 timer
-(void)nstimer{
    __weak typeof(self)weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        weakSelf.timeCount ++;
        NSLog(@"i %d",weakSelf.timeCount);
    } repeats:YES];

}
#pragma mark ----------- 4 dispatch_source_t
-(void)timerWithdispatchQueue{
//    __weak typeof(self)weakSelf = self;
    __block int timeout = 10;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"已经为0");
            });
        } else {
            int seconds = timeout % 11;
            NSString * strTime = [NSString stringWithFormat:@"%.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"strTime %@",strTime);
            });
            timeout --;
        }
    });
    dispatch_resume(_timer);
}
@end

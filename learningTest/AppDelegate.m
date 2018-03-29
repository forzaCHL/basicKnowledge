//
//  AppDelegate.m
//  learningTest
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "GetTextHeight.h"
#import "GCDVC.h"
#import "TestVC.h"
#import "PlayerVC.h"
#import "BlockTestVC.h"
#import "NavViewController.h"
#import "HTTPRequestVC.h"
#import <AVFoundation/AVFoundation.h>
#import "AFNetworking.h"
#import "AppPushViewController.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "FirstViewController.h"
#import "UIViewFrame.h"
#import "SortVC.h"
#import <objc/runtime.h>
#import "KvokvcVC.h"
#import "RuntimeVC.h"
#import "StaticLibraryVC.h"
@interface AppDelegate ()

@property(nonatomic,assign) BOOL shouldStopBg;
@property(nonatomic,strong)AVAudioPlayer * audioPlayer;
@property(nonatomic,assign)NSInteger optionNumber;
@property(nonatomic,assign)NSTimeInterval interViewTime;


@end

@implementation AppDelegate

@synthesize allowRotation;

@synthesize netWorkStatesCode;



/**
 统一捕获异常
 
 @param exception 异常信息
 */
void gloablException(NSException * exception) {
    
#ifdef DEBUG
    // 异常信息打印
    NSLog(@"异常信息:\n%@", exception);
    NSLog(@"异常堆栈信息:\n %@", [exception callStackSymbols]);
    
#else
    
    // TODO: 可以直接将 exception 中的所有信息发到服务器.
    
#endif
    
    // 重启
    [[NSRunLoop currentRunLoop]addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]run];
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    GetTextHeight *vc = [GetTextHeight new];
//    DataVC *vc = [DataVC new];
//    TestVC *vc = [TestVC new];
//    GCDVC *vc = [GCDVC new];
    
    
    // 捕获所有异常
    NSSetUncaughtExceptionHandler(gloablException);
    
    
    StaticLibraryVC *vc = [StaticLibraryVC new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self netWorkChangeEvent];
    [self setUpMusicOption];
    [self setUpMusicOptionsWithNormal:YES];
    return YES;
}
#pragma mark - 检测网络状态变化
-(void)netWorkChangeEvent
{
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        self.netWorkStatesCode = status;
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"当前使用的是流量模式");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
//                NSLog(@"当前使用的是wifi模式");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"断网了");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"变成了未知网络状态");
                break;
                
            default:
                break;
        }
        [[NSNotificationCenter defaultCenter]postNotificationName:@"netWorkChangeEventNotification" object:@(status)];
    }];
    [manager.reachabilityManager startMonitoring];
}
#pragma mark -  应用退到后台或者上划出来控制界面下划出来通知界面都会走这个方法
- (void)applicationWillResignActive:(UIApplication *)application {
    [self setUpMusicOptionsWithNormal:YES];
    [self performSelectorInBackground:@selector(playEmptyMusicInBackGround) withObject:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"applicationWillResignActive" object:nil];
}
#pragma mark - 从上面的场景中回到应用就会执行这个方法
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(playEmptyMusicInBackGround) object:nil];
    [self setUpMusicOptionsWithNormal:NO];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"applicationDidBecomeActive" object:nil];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}
#pragma mark - 设置music播放相关参数
-(void)setUpMusicOptionsWithNormal:(BOOL)normal
{
    if (normal) {
        self.optionNumber = 1;
        self.interViewTime = 1.0;
    }
    else{
        self.optionNumber = -1;
        self.interViewTime = 0.01;
    }
}

#pragma mark -设置music播放器
-(void)setUpMusicOption
{
    NSURL *musicUrl = [[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"60秒静音" ofType:@"mp3"]];
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:musicUrl error:nil];
    self.audioPlayer.numberOfLoops = 0;
    self.audioPlayer.volume = 0;
}

#pragma mark -后台播放没有声音的音乐
-(void)playEmptyMusicInBackGround
{
    
    UIBackgroundTaskIdentifier bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
    _shouldStopBg = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
        while ( self.optionNumber != 0 ) {
            if ( _shouldStopBg ){ break; }
            float remainTime = [[UIApplication sharedApplication] backgroundTimeRemaining];
            NSLog(@"###!!!BackgroundTimeRemaining: %f",remainTime);
            if ( remainTime < 20.0 ){
                NSLog(@"start play audio!");
                NSError *audioSessionError = nil;
                AVAudioSession *audioSession = [AVAudioSession sharedInstance];
                if ( [audioSession setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:&(audioSessionError)] )
                {
                    NSLog(@"set audio session success!");
                }else{
                    NSLog(@"set audio session fail!");
                }
                [self.audioPlayer play];
                [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
            }
            self.optionNumber ++;
            [NSThread sleepForTimeInterval:self.interViewTime];
        }
    });
}



- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"learningTest"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
#pragma mark - 释放应用
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"applicationDidBecomeActive" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"applicationWillResignActive" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"netWorkChangeEventNotification" object:nil];
}
@end

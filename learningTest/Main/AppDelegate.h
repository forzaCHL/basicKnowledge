//
//  AppDelegate.h
//  learningTest
//
//  Created by Apple on 2017/10/12.
//  Copyright © 2017年 Apple. All rights reserved.
//










#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

/*
 决定是不是可以允许转屏的参数
 */
@property(nonatomic,assign)BOOL allowRotation;

/*
 当前的网络状态
 */
@property(nonatomic,assign)int netWorkStatesCode;


+(AppDelegate *)shareInstance;
@end


//
//  StaticLibraryVC.m
//  learningTest
//
//  Created by Apple on 2018/3/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "StaticLibraryVC.h"
#import "BaseCell.h"
#import <NewFrameTest/NewFrameTest.h>

@interface StaticLibraryVC ()

@end

@implementation StaticLibraryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    BaseCell *cell = [[BaseCell alloc]init];
//    [cell log];
    [BaseCell log];
     [FrameLog log];
//    [Coding coding];
    
}
/**
1.new project
2.run iphoneos and run iphonesimulator
3.out put a new Static Lib(.a)
4.use it
 */


@end

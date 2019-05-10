//
//  CategerVC.m
//  learningTest
//
//  Created by Apple on 2018/3/16.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CategerVC.h"
#import "cateSubVC.h"
#import "NSString+Emoji.h"
#import "CategerVC+category.h"


@interface CategerVC ()

@end

@implementation CategerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    cateSubVC *vc = [cateSubVC new];
    [self methods];
    [vc methods];
    
    NSString *biaoqing = @"😊";
    NSString *wenzi = @"wenzi";

    BOOL b1 = [NSString isContainsEmoji:biaoqing];
    BOOL b2 = [NSString isContainsEmoji:wenzi];
    NSLog(@"----%d----%d",b1,b2);
    
    
    
    
}
-(void)methods{
    NSLog(@"CategerVC");
}

/**
 类本身也是一个对象 class类型的对象
任何直接或间接继承了NSObject的类，它的实例对象(instance objec)中都有一个isa指针，指向它的类对象(class object)。

1.程序启动后，系统会将所有类加载进内存-即代码区。
 
2.当需要用到GSPerson类时，系统会先在堆中创建一个对象，俗称类对象。
 
     2.1.内部创建一个isa指针指向源类对象
 
     2.2系统会在类对象中包含该类的所有成员属性、对象方法
 
     2.3源类对象：
 
         2.3.1内部创建一个isa指针指向根源类对象－NSObject
 
         2.3.2系统会在类对象中包含该类对象方法
 
          2.3.3根源类对象－NSObject
 
              2.3.3.1内部创建一个isa指针指向自己本身
 
3.[[GSPerson alloc] init]系统做了三件事：
 
     3.1.alloc:
 
         3.1.1.内部创建一个isa指针指向类对象
 
         3.1.2.在堆中分配一块存储空间
 
         3.1.3.初步初始化，将成员变量初始化为零
 
         3.1.4.返回对象
 
     3.2.init：对成员变量进行初始化
 
     3.3.返回对象

 */
@end

//
//  PropertyViewController.m
//  learningTest
//
//  Created by chen on 2019/9/25.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "PropertyViewController.h"
#import "QiViewController.h"


@interface PropertyViewController ()

//readwrite readonly 设置读写权限  setter、getter方法生成
@property(nonatomic,copy,readwrite)NSString *name;


//retain 针对对象类型  指针变量  进行内存管理
//当给对象类型使用此修饰符时，setter方法会先将旧的对象属性release掉，再对新的对象进行一次赋值并进行一次retain操作
@property(nonatomic,retain)QiViewController *qvc;

//assign 直接赋值修饰基本数据类型  id类型  非指针变量   解决原类型与环循引用
@property(nonatomic,assign)NSInteger i;
//主要用在NSString类型，表示复制内容。   block也用copy修饰
@property(nonatomic,copy)NSString *str;

//系统默认属性是assign。retain是指针的复制，copy是内容的复制
//strong类似于retain，weak类似于assign


@property(getter = getMethodName, setter = setMethodName:) NSString *obj;

@end

@implementation PropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.name = @"blll";
    NSLog(@"name -- %@",self.name);
    
    NSLog(@"obj -- %@",self.obj);

    
}
-(NSString *)getMethodName{

    return self.obj;

}
-(NSString *)setMethodName:(NSString *)name{
    
    return name;
}
@end

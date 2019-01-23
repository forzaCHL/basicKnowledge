//
//  Operation ViewController.m
//  learningTest
//
//  Created by Apple on 2019/1/14.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "OperationViewController.h"



@interface OperationViewController ()

@end

@implementation OperationViewController

@synthesize fitstStr = setName;
@dynamic senondStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"基础面试";
//    NSLog(@"_firstStr %@",_firstStr);//报错 @synthesize 修饰后找不到_firstStr
    NSLog(@"self.fitstStr %@",self.fitstStr);
    NSLog(@"setName %@",setName);
    
    NSLog(@"self.senondStr %@",self.senondStr);//闪退  @dynamic修饰后要重写setter getter方法
    [self operation];
}
-(NSString *)senondStr{
    return [NSString string];
}
#pragma mark ----------- 算数运算
-(void)operation{
    int a,b;
    a=10;b=12;
    a=b-a; //a=2;b=12
    b=b-a; //a=2;b=10
    a=b+a; //a=12;b=10
}
/**
 1 === http 的 POST 和 GET 区别
 最直观的区别就是GET是获取数据、POST是提交数据
 GET请求的数据会附在URL之后
 POST把提交的数据则放置在是HTTP包的包体中
 GET请求URL受浏览器影响 所以有长度限制
 POST没有，一般服务器会做POST数据长度的限制
 POST的数据传输不是直接拼接URL 所以相对安全一些
 
 2 === 介绍一下XMPP
 XMPP是一种以XML为基础的开放式实时通信协议。
 XMPP 是一种很类似于http协议的一种数据传输协议，它的过程就如同“解包装–>包装”的过程，用户只需要明白它接受的类型，并理解它返回的类型，就可以很好的利用xmpp来进行数据通讯。基于可扩展标记语言（XML）的协议
 XMPP基本结构：客户端 服务器 网关
 通信能够在这三者的任意两个之间双向发生。服务器同时承担了客户端信息记录，连接管理和信息的路由功能。网关承担着与异构即时通信系统的互联互通，异构系统可以包括SMS（短信），MSN，ICQ等。基本的网络形式是单客户端通过TCP/IP连接到单服务器，然后在之上传输XML。
 XMPP核心协议通信的基本模式就是先建立一个stream，然后协商一堆安全之类的东西，中间通信过程就是客户端发送XML Stanza，一个接一个的。服务器根据客户端发送的信息以及程序的逻辑，发送XML Stanza给客户端。但是这个过程并不是一问一答的，任何时候都有可能从一方发信给另外一方。通信的最后阶段是关闭流，关闭TCP/IP连接。
 客户端1   XMPP服务器   客户端2
 两个客户端可以分别和服务器通信，但是客户端之间的通信必须经过服务器
 用于一些即时通信

 3 === const的作用
 常量定义，修饰一个常量
 
 int a = 1;
 int b = 2;
 
 int const *p = &a
 // 如果const修饰的是*p，那么*p的值是不能改变的，也就是p中存放的a的地址中的值无法改变，但是p的值是可以改变的（也就是p此时可以改变指向）
 p = &b;
 printf("---");
 printf("%p",&b);
 printf("---");
 printf("%p",p);
 printf("---");
 printf("%d",*p);
 
 //输出 ---0x7ffeea7e89f8---0x7ffeea7e89f8---2
 
 int *const p = &a;
 // 如果const修饰的是p，那么p的值是不能改变的，也就是p中存放的a的地址无法改变（p是int类型的指针变量）。但是*p是可以变化的，我们并没有用const去修饰*p，所以可以通过*p去改变a的值
 *p = b;

 4 === static的作用
 static NSInteger staticValue = 0;
 static关键字修饰局部变量：
 当static关键字修饰局部变量时，只会初始化一次且在程序中只有一份内存
 关键字static不可以改变局部变量的作用域，但可延长局部变量的生命周期（直到程序结束才销毁）
 static关键字修饰全局变量：
 当static关键字修饰全局变量时，作用域仅限于当前文件，外部类是不可以访问到该全局变量的（即使在外部使用extern关键字也无法访问）
 如果需要直接访问  需要引用头文件
 
 5 === 宏定义：宏定义属于预编译指令，在程序运行之前已经编译好了的
 
 6 === @property 的本质是什么？
 @property = ivar + getter + setter;
 “属性” (property)有两大概念：ivar（实例变量）、getter+setter（存取方法）
 “属性” (property)作为 Objective-C 的一项特性，主要的作用就在于封装对象中的数据。 Objective-C 对象通常会把其所需要的数据保存为各种实例变量。实例变量一般通过“存取方法”(access method)来访问。其中，“获取方法” (getter)用于读取变量值，而“设置方法” (setter)用于写入变量值。
 
 @synthesize  @dynamic
 完成属性（@property）定义后，编译器会自动编写访问这些属性所需的方法，此过程叫做“自动合成”(autosynthesis)。
 我们也可以在类的实现代码里通过 @synthesize 语法来指定实例变量的名字。
 @synthesize lastName = _myLastName;
 或者通过 @dynamic 告诉编译器：属性的 setter 与 getter 方法由用户自己实现，不自动生成。
 @property有两个对应的词，
 一个是@synthesize（合成实例变量），一个是@dynamic。
 如果@synthesize和@dynamic都没有写，那么默认的就是 @synthesize var = _var;
 // 在类的实现代码里通过 @synthesize 语法可以来指定实例变量的名字。(@synthesize var = _newVar;)
 1. @synthesize 的语义是如果你没有手动实现setter方法和getter方法，那么编译器会自动为你加上这两个方法。
 2. @dynamic 告诉编译器，属性的setter与getter方法由用户自己实现，不自动生成（如，@dynamic var）。

 7 === 用@property声明的 NSString / NSArray / NSDictionary 经常使用 copy 关键字，为什么？如果改用strong关键字，可能造成什么问题？
 用 @property 声明 NSString、NSArray、NSDictionary 经常使用 copy 关键字，是因为他们有对应的可变类型：NSMutableString、NSMutableArray、NSMutableDictionary，他们之间可能进行赋值操作（就是把可变的赋值给不可变的），为确保对象中的字符串值不会无意间变动，应该在设置新属性值时拷贝一份。
 1. 因为父类指针可以指向子类对象,使用 copy 的目的是为了让本对象的属性不受外界影响,使用 copy 无论给我传入是一个可变对象还是不可对象,我本身持有的就是一个不可变的副本。
 2. 如果我们使用是 strong ,那么这个属性就有可能指向一个可变对象,如果这个可变对象在外部被修改了,那么会影响该属性。
 //总结：使用copy的目的是，防止把可变类型的对象赋值给不可变类型的对象时，可变类型对象的值发送变化会无意间篡改不可变类型对象原来的值。
 引申：NSMutableArray 如果用 copy修饰了会出现什么问题?
 Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSArray0 addObject:]: unrecognized selector sent to instance 0x600000a100c0'
 由于使用的是copy属性，本身的可变属性默认有一个不可变的拷贝 NSArray ，所以我们用这个可变数组去添加元素的时候，找不到对应方法而发生crash。
 
8 === 浅拷贝与深拷贝
 浅拷贝（copy）：只复制指向对象的指针，而不复制引用对象本身。
 深拷贝（mutableCopy）：复制引用对象本身。内存中存在了两份独立对象本身，当修改A时，A_copy不变。
 只有对不可变对象进行copy操作是指针复制（浅复制），其它情况都是内容复制（深复制）
 
 9 === ViewController生命周期
 按照执行顺序排列：
 1. initWithCoder：通过nib文件初始化时触发。
 2. awakeFromNib：nib文件被加载的时候，会发生一个awakeFromNib的消息到nib文件中的每个对象。
 //如果不是nib初始化 上面两个换成 initWithNibName:bundle:
 3. loadView：开始加载视图控制器自带的view。
 4. viewDidLoad：视图控制器的view被加载完成。
 5. viewWillAppear：视图控制器的view将要显示在window上。
 6. updateViewConstraints：视图控制器的view开始更新AutoLayout约束。
 7. viewWillLayoutSubviews：视图控制器的view将要更新内容视图的位置。
 8. viewDidLayoutSubviews：视图控制器的view已经更新视图的位置。
 9. viewDidAppear：视图控制器的view已经展示到window上。
 10. viewWillDisappear：视图控制器的view将要从window上消失。
 11. viewDidDisappear：视图控制器的view已经从window上消失。
 
 
 http://www.cocoachina.com/ios/20190114/25894.html
 */


@end

//
//  PropertyVC.m
//  learningTest
//
//  Created by Apple on 2018/3/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "PropertyVC.h"

@interface PropertyVC ()

@end

@implementation PropertyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self strong];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
#pragma mark ----------- weak and strong
-(void)weakAndStrong{
    /**
     默认是强引用
     强引用持有对象，而弱引用不持有对象
     strong的对象会使retainCount+1，而weak的并不会。
     */
    __strong NSObject *obj1=[[NSObject alloc] init];
    
    __strong NSObject *obj2=obj1;
    
    NSLog(@"strong-->%@,%@",obj1,obj2);//都是同一个值 地址
    
    obj1=nil;
    
    NSLog(@"strong-->%@,%@",obj1,obj2);//null、xxx
    
    NSLog(@"---------------------------------------");
    
    __strong NSObject *obj3=[[NSObject alloc] init];
    
    __weak NSObject *obj4=obj3;
    
    NSLog(@"weak-->%@,%@",obj3,obj4);//都是同一个值 地址
    
    obj3=nil;
    
    NSLog(@"weak-->%@,%@",obj3,obj4);//null、null
}
#pragma mark ----------- weak和assign
-(void)weak{
/**
weak和assign，两者都可以用于弱引用，但是内存释放后使用weak会将对象置nil，而assign不会，会造成野指针，现在assign一般只用在基础类型
*/
}
#pragma mark ----------- retain和strong
-(void)strong{
/**
retain和strong都是 指针拷贝。 当有其他对象引用当前对象时，会拷贝一份当前对象的地址，这样它就也指向当前对象了。所以，还是同一个对象，只是retainCount+1  ---- 浅拷贝
 而copy则是 内容拷贝。 是实实在在的拷贝一个新的对象，拷贝了它的内存内容，成为一个新的对象（retainCount=1） --- 深拷贝
 */
    NSString *str1 = @"test001";
    
    NSMutableString *str2 = [str1 copy];
    //copy返回的是不可变对象，str2不能被修改，因此会发生崩溃
//    [str2 appendString:@"modify"];
    
    NSMutableString *str3 = [str1 mutableCopy];
    [str3 appendString:@"modify"];
    
    NSLog(@"str1:%p - %@ \r\n",str1,str1);
    NSLog(@"str2:%p - %@ \r\n",str2,str2);
    NSLog(@"str3:%p - %@ \r\n",str3,str3);
    
}
@end

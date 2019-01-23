//
//  ShareObj.m
//  learningTest
//
//  Created by Apple on 2019/1/22.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "ShareObj.h"

@implementation ShareObj

//static ShareObj *_obj = nil;
//+(instancetype)sharedObj{
//    
//    if (_obj == nil) {
//        _obj = [[ShareObj alloc]init];
//    }
//    return _obj;
//}

//static ShareObj *_objB = nil;
//+ (instancetype)sharedObjtypeB{
//    if (_objB == nil) {
//        _objB = [[ShareObj alloc]init];
//    }
//    return _objB;
//}
////重写alloc方法 或者底层allocWithZone
//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//    if (_objB == nil) {
//        _objB = [super allocWithZone:zone];
//    }
//    return _objB;
//}
////当copy当前类型的对象时候 ，返回唯一的单例对象
//- (id)copyWithZone:(NSZone *)zone {
//    return _objB;
//}

//static ShareObj *_instance;
//+ (id)allocWithZone:(struct _NSZone *)zone
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [super allocWithZone:zone];
//    });
//
//    return _instance;
//}
//+ (instancetype)sharedObjtypeC
//{
//    if (_instance == nil) {
//        _instance = [[ShareObj alloc] init];
//    }
//
//    return _instance;
//}
//-(id)copyWithZone:(NSZone *)zone
//{
//    return _instance;
//}
//使用宏定义
singleton_implementation(ShareObj)

/**
 非完全意义上的单例:alloc、copy、还是使用shared方法创建出来的单例对象都是不相同
 完全意义上的单例：就是无论我们是alloc、copy、还是使用shared方法创建出来的单例对象都是一个
 线程安全的单例：就是多个线程同时访问的时候不会出现多个对象；
 非线程安全的单例：就是多个线程同时访问的时候可能会出现多个对象。
 */
@end

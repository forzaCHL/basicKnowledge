//
//  Header.h
//  learningTest
//
//  Created by Apple on 2019/1/22.
//  Copyright © 2019年 Apple. All rights reserved.
//

#ifndef defineFile_h
#define defineFile_h

/*
 专门用来保存单例代码
 */

// @interface
#define singleton_interface(className) \
+ (className *)shared##className;


// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}



#endif /* Header_h */

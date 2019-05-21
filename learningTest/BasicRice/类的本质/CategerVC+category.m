//
//  CategerVC+category.m
//  learningTest
//
//  Created by Apple on 2019/3/21.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "CategerVC+category.h"
#import <objc/runtime.h>



@implementation CategerVC (category)

//优先调用分类的方法
-(void)methods{
    NSLog(@"category");
}


@end

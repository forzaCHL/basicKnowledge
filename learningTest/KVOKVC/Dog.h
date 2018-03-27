//
//  Dog.h
//  learningTest
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Master.h"

@interface Dog : NSObject{
    //私有属性
@private
    int _money;
}

@property(nonatomic,strong)NSString *name;

@property(nonatomic,assign)int age;

@property(nonatomic,strong)Master *master;//主人  指向一个类
-(void)showMsg;
@end

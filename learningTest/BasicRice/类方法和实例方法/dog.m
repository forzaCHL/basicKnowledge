//
//  dog.m
//  learningTest
//
//  Created by Apple on 2019/3/4.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "dog.h"

@implementation dog


+(void)eat{
    NSLog(@"eat");
//    NSLog(@"%@",self->name);//报错
}

-(void)sleep{
    NSLog(@"sleep");
    [self speak];
    NSLog(@"%@",self.name);
}
-(void)speak{
    NSLog(@"speak");
}
@end

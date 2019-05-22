//
//  cateSubVC.m
//  learningTest
//
//  Created by Apple on 2019/3/21.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "cateSubVC.h"

@interface cateSubVC ()

@end

@implementation cateSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"继承名字";

}
-(void)methods{
    NSLog(@"cateSubVC");
}
-(instancetype)init{
    if (self == [super init]) {
        NSLog(@"1-%@",[self class]);
        NSLog(@"2-%@",[super class]);
        NSLog(@"3-%@",[self superclass]);
        NSLog(@"4-%@",[super superclass]);
    }
    return self;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

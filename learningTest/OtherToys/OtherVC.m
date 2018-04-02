//
//  OtherVC.m
//  learningTest
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "OtherVC.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Other Chicken Leg";
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AppPushViewController *vc = [AppPushViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

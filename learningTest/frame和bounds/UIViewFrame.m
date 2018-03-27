//
//  UIViewFrame.m
//  learningTest
//
//  Created by Apple on 2018/3/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIViewFrame.h"

@interface UIViewFrame ()

@end

@implementation UIViewFrame

- (void)viewDidLoad {
    [super viewDidLoad];
    
/**
frame是相对父视图位置 bounds是相对自己的位置
*/
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 300, 300)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    UIView *viewi = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    viewi.backgroundColor = [UIColor yellowColor];
    [view addSubview:viewi];
    
    NSLog(@"view frame%@  bounds%@",NSStringFromCGRect(view.frame),NSStringFromCGRect(view.bounds));
    NSLog(@"viewi frame%@  bounds%@",NSStringFromCGRect(viewi.frame),NSStringFromCGRect(viewi.bounds));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

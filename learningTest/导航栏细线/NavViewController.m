//
//  NavViewController.m
//  learningTest
//
//  Created by Apple on 2018/1/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "NavViewController.h"
#import "TestVC.h"
@interface NavViewController ()

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"底部红色";
    UIImage *colorImage = [self imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 1)];
    
    [self.navigationController.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[self imageWithColor:[UIColor redColor] size:CGSizeMake(self.view.frame.size.width, 0.5)]];
    

}
-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    if (!color || size.width <=0 || size.height <=0) return nil;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TestVC *vc = [TestVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  UIBarButtonItem+Extension.m
//  CloudStudy
//
//  Created by Wilson on 16/7/4.
//  Copyright © 2016年 蓝泰致铭. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)leftItemWithTarget:(id)target action:(SEL)action image:(NSString *)imageStr highLightImage:(NSString *)highLightImage {
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highLightImage] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView * customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [btn setFrame:CGRectMake(-15, 0, 44, 44)];
    [customView addSubview:btn];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightItemWithTarget:(id)target action:(SEL)action image:(NSString *)imageStr hightLightImage:(NSString *)hightLightImage {
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightLightImage] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView * customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [btn setFrame:CGRectMake(20, 0, 44, 44)];
    [customView addSubview:btn];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end

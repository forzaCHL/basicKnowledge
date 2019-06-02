//
//  UIBarButtonItem+Extension.h
//  CloudStudy
//
//  Created by Wilson on 16/7/4.
//  Copyright © 2016年 蓝泰致铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)leftItemWithTarget:(id)target action:(SEL)action image:(NSString *)imageStr highLightImage:(NSString *)highLightImage;

+ (UIBarButtonItem *)rightItemWithTarget:(id)target action:(SEL)action image:(NSString *)imageStr hightLightImage:(NSString *)hightLightImage;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end

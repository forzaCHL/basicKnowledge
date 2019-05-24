//
//  UIButton+ZXYCategory.h
//  CloudStudy
//
//  Created by 蓝泰致铭        on 2017/1/19.
//  Copyright © 2017年 蓝泰致铭. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonZXYCategoryBlock)();

@interface UIButton (ZXYCategory)

- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor touchBlock:(ButtonZXYCategoryBlock)block;

///浅灰色按钮.
- (void)becomeGaryButton;

/** 浅灰色按钮的文字 */
- (void)becomeGaryButton:(NSString *)title;

@end

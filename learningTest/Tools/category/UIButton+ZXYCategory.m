//
//  UIButton+ZXYCategory.m
//  CloudStudy
//
//  Created by 蓝泰致铭        on 2017/1/19.
//  Copyright © 2017年 蓝泰致铭. All rights reserved.
//

#import "UIButton+ZXYCategory.h"

@implementation UIButton (ZXYCategory)

- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor touchBlock:(ButtonZXYCategoryBlock)block {
    
    self = [[self class] buttonWithType:UIButtonTypeCustom];
    if (self) {
        
        if (title) {
            [self setTitle:title forState:UIControlStateNormal];
        }
        if (titleFont) {
            [self.titleLabel setFont:titleFont];
        }
        if (titleColor) {
            [self setTitleColor:titleColor forState:UIControlStateNormal];
        }
        if (block) {
            [self addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
                block();
            }];
        }
    }
    return self;
}

- (void)becomeGaryButton {
    
    [self becomeGaryButton:nil];
}

- (void)becomeGaryButton:(NSString *) title {
    
    self.userInteractionEnabled = NO;
    [self setBackgroundColor:RGB(188, 188, 194)];
    if (title) {
        [self setTitle:title forState:UIControlStateNormal];
    }
}

@end

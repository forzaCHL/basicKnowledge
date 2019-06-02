//
//  UILabel+ZXYCategory.h
//  CloudStudy
//
//  Created by 蓝泰致铭        on 2017/1/3.
//  Copyright © 2017年 蓝泰致铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZXYCategory)

/** init方法 */
- (instancetype)initWithFont:(UIFont*)font textColor:(UIColor*)textColor;

/** 返回文本行数 */
- (CGFloat)numberOfText;

/** 设置内容和间隔 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

/** 布局label需要的高度并改变 */
-(CGFloat)heightForContent;

/** 根基lable内容计算宽度 */
-(CGFloat)widthForContent;

@end

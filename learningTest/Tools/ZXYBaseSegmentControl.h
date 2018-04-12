//
//  TopBarContentView.h
//  CloudStudyPeiban
//
//  Created by pro2 on 16/5/17.
//  Copyright © 2016年 netschina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXYBaseSegmentControl;
@protocol BaseSegmentControlDelegate <NSObject>
@optional
/**
 *  返回选中索引
 *
 *  @param index 索引值
 */
- (void)segmentControlWithButtonClickIndex:(NSUInteger)index;
- (void)segmentControl:(ZXYBaseSegmentControl *)contrl withButtonClickIndex:(NSUInteger)index;
@end

@interface ZXYBaseSegmentControl : UIView
/**
 *  字体样式以及字体大小 传值如下：
 *  [UIFont fontWithName:@"Euphemia UCAS" size:13.f]
 */
@property (strong, nonatomic) UIFont *contentFont;
/**
 *  字体颜色
 */
@property (strong, nonatomic) UIColor *contentColor;
/**
 *  默认选中，下标从0开始
 */
@property (assign, nonatomic) NSUInteger defaultSelected;
/**
 *  指示器图像名
 */
@property (copy, nonatomic) NSString *indicatorName;
/**
 *  标题数组
 */
@property (strong, nonatomic) NSArray *titlesArray;
/**
 *  当前选中的下标
 */
@property (assign, nonatomic) NSInteger currentSelectedIndex;

@property (weak, nonatomic) id<BaseSegmentControlDelegate> delegate;
/**
 *  创建
 */
- (void)createView;

- (void)topBarButtonClick:(UIButton *)btn;

- (void)updateCurrentIndicatorWithIndex:(NSInteger)currentSelectedIndex;

@end

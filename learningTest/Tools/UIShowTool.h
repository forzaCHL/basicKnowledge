//
//  UIShowTool.h
//  CloudStudy
//
//  Created by 蓝泰致铭        on 15/1/30.
//  Copyright (c) 2015年 ZXY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#define delayInterval 1.5

typedef void(^ShowToolBlock)();

/**
 *
 *  弹出提示框相关
 *
 **/

@interface UIShowTool : NSObject{
    
    
}


/**
 *  弹出alert
 *
 *  @param msg 消息内容
 */
+(void)alert:(NSString*)msg;

/**
 *  弹出alert
 *
 *  @param title 标题
 *  @param msg   消息内容
 *  @param btn   按钮文本
 */
+(void)alertWithTitle:(NSString*)title
                  msg:(NSString*)msg
                  btn:(NSString*)btn;

/**
 *  持续显示的提示框在window上
 *
 *  @param text 显示的文本
 */
+(void)showActivityViewInWindowAndText:(NSString*)text;

/**
 *  显示带时限的等待进度提示框在window上
 *
 *  @param text 显示的文本
 *  @param time 显示时间
 */
+ (void)showActivityViewInWindowAndtext:(NSString*)text
                               interval:(NSTimeInterval)time;

/**
 *显示内容在window上,默认显示1.5s
 */
+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text;

/**
 *显示内容在window上部,默认显示1.5s
 */
+ (void)showNormalyTextViewInWindowAndtextOnTop:(NSString *)text;
/**
 *
 *显示内容在window上,默认显示1.5s后回调
 *
 */
+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text
                                  callBack:(ShowToolBlock)block;

/**
 *  显示普通的文字提示框在window上
 *
 *  @param text 显示的文本
 *  @param time 显示时间
 */
+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text
                                  interval:(NSTimeInterval)time;

/**
 *  显示普通的文字提示框在window上，并在显示完后回调
 *
 *  @param text 显示的文本
 *  @param time 显示时间
 */
+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text
                                  interval:(NSTimeInterval)time
                                  callBack:(ShowToolBlock)block;
/**
 *  隐藏window上所有提示框
 */
+ (void)hideActivityViewInWindow;

/**
 *  显示带时限的等待进度提示框
 *
 *  @param view - 要显示到的view
 *  @param text - 显示的文本
 *  @param time - 显示时间
 */

+ (void)showActivityViewInView:(UIView*)view
                          text:(NSString*)text
                      interval:(NSTimeInterval)time;

/**
 *  持续显示的提示框
 *
 *  @param view - 要显示到的view
 *  @param text - 显示的文本
 */
+ (void)showActivityViewInView:(UIView*)view
                          text:(NSString *)text;

/**
 *  显示普通的文字提示框
 *
 *  @param view 要显示到的view
 *  @param text 显示的文本
 *  @param time 显示时间
 */
+ (void)showNormalyTextViewInView:(UIView*)view
                             text:(NSString *)text
                         interval:(NSTimeInterval)time;

/**
 *  隐藏view上所有提示框
 *
 *  @param view 要显示到的view
 */
+ (void)hideActivityViewInView:(UIView*)view;

/**
 *  弹出图片
 *
 *  @param imageView 容器
 *  @param picUrl    图片路径
 */
+(void)showBigImageViewOnViewController:(UIImageView *)imageView
                               withPath:(NSString *)picUrl;

@end

//
//  UIShowTool.m
//  CloudStudy
//
//  Created by 蓝泰致铭        on 15/1/30.
//  Copyright (c) 2015年 ZXY. All rights reserved.
//

#import "UIShowTool.h"
#import "AppDelegate.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"
#import "MBProgressHUD+mutiLine.h"

@implementation UIShowTool

#pragma mark - UIAlertView methods author: houhui
//定义alertView弹出框

+(void)alert:(NSString*)msg
{
    [self alertWithTitle:@"温馨提示" msg:msg btn:@"确认"];
}

+(void)alertWithTitle:(NSString*)title msg:(NSString*)msg btn:(NSString*)btn
{
    if (kiOS8Later) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:btn
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action) {
                                                    
                                                }]];
        AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appdelegate.window.rootViewController presentViewController:alert animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alert show];
    }
}

+(AppDelegate*)getAppDelegate{
    
    return [AppDelegate shareInstance];
}


#pragma mark - MBProgressHUD Method author:houhui
+(void)showActivityViewInWindowAndText:(NSString*)text
{
    [self hideActivityViewInWindow];
//    AppDelegate *appDelegate = [self getAppDelegate];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:appDelegate.window];
    [appDelegate.window addSubview:hud];
    [hud showFitText:text];
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud show:YES];
}

+ (void)showActivityViewInWindowAndtext:(NSString*)text
                               interval:(NSTimeInterval)time{
    
    [self hideActivityViewInWindow];
//    AppDelegate *appDelegate = [self getAppDelegate];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:appDelegate.window];
    [appDelegate.window addSubview:hud];
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud showFitText:text];
    [hud addTapGesture];
    if ([hud isHidden]) {
        [hud show:YES];
    }
    [hud hide:YES afterDelay:time];
}

+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text{
    
    [self hideActivityViewInWindow];
//    AppDelegate *appDelegate = [self getAppDelegate];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:appDelegate.window];
    [appDelegate.window addSubview:hud];
    
    if (text != nil && ![text isEqualToString:@""]) {
        
        hud.mode = MBProgressHUDModeText;
        [hud showFitText:text];
        [hud addTapGesture];
        [hud show:YES];
        [hud hide:YES afterDelay:delayInterval];
    }
    else
    {
        [hud hide:YES];
    }
}

+ (void)showNormalyTextViewInWindowAndtextOnTop:(NSString *)text{
    
    [self hideActivityViewInWindow];
//    AppDelegate *appDelegate = [self getAppDelegate];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:appDelegate.window];
    [appDelegate.window addSubview:hud];
    
    if (text != nil && ![text isEqualToString:@""]) {
        
        hud.mode = MBProgressHUDModeText;
        hud.xOffset = 0;
        hud.yOffset = -100;
        [hud showFitText:text];
        [hud addTapGesture];
        [hud show:YES];
        [hud hide:YES afterDelay:delayInterval];
    }
    else
    {
        [hud hide:YES];
    }
}

+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text callBack:(ShowToolBlock)block {
    
    [UIShowTool showNormalyTextViewInWindowAndtext:text];
    [UIShowTool delayTime:delayInterval callBack:block];
}

+(void)delayTime:(NSTimeInterval)time
        callBack:(ShowToolBlock)block{
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInterval * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        block();
    });
}

+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text
                                  interval:(NSTimeInterval)time{
    
    [self hideActivityViewInWindow];
//    AppDelegate *appDelegate = [self getAppDelegate];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:appDelegate.window];
    [appDelegate.window addSubview:hud];
    if (text != nil && ![text isEqualToString:@""]) {
        hud.mode = MBProgressHUDModeText;
        [hud showFitText:text];
        [hud addTapGesture];
        [hud show:YES];
        [hud hide:YES afterDelay:time];
    }
    else
    {
        [hud hide:YES];
    }
}

+ (void)showNormalyTextViewInWindowAndtext:(NSString *)text
                                  interval:(NSTimeInterval)time
                                  callBack:(ShowToolBlock)block{
    
    [UIShowTool showNormalyTextViewInWindowAndtext:text interval:time];
    [UIShowTool delayTime:time callBack:block];
}

+ (void)hideActivityViewInWindow{
    
//    AppDelegate *appDelegate = [self getAppDelegate];
    [MBProgressHUD hideAllHUDsForView:appDelegate.window animated:YES];
    [MBProgressHUD hideHUDForView:appDelegate.window animated:NO];
}


+ (void)showActivityViewInView:(UIView*)view
                          text:(NSString*)text
                      interval:(NSTimeInterval)time{
    
    [self hideActivityViewInView:view];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud showFitText:text];
    [hud addTapGesture];
    if ([hud isHidden]) {
        [hud show:YES];
    }
    [hud hide:YES afterDelay:time];
}


+ (void)showActivityViewInView:(UIView*)view text:(NSString *)text{
    
    [self hideActivityViewInView:view];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    [hud showFitText:text];
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud show:YES];
}


+ (void)showNormalyTextViewInView:(UIView*)view
                             text:(NSString *)text
                         interval:(NSTimeInterval)time{
    
    [self hideActivityViewInView:view];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    if (text != nil && ![text isEqualToString:@""]) {
        hud.mode = MBProgressHUDModeText;
        [hud showFitText:text];
        [hud addTapGesture];
        [hud show:YES];
        [hud hide:YES afterDelay:time];
    }else {
        [hud hide:YES];
    }
}

+ (void)hideActivityViewInView:(UIView*)view {
    
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

+(void)showBigImageViewOnViewController:(UIImageView *)imageView withPath:(NSString *)picUrl{
    
    NSString *getImageStrUrl = picUrl;
    MJPhoto *photo = [[MJPhoto alloc] init];
    photo.url = [NSURL URLWithString: getImageStrUrl]; // 图片路径
    
    photo.srcImageView = imageView;
    
    NSMutableArray *photos = [NSMutableArray arrayWithObject:photo];
    
    // 2.显示相册
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = 0; // 弹出相册时显示的第一张图片是？
    browser.photos = photos; // 设置所有的图片
    [browser show];
}

@end

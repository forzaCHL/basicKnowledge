//
//  MBProgressHUD+mutiLine.h
//  CloudStudy
//
//  Created by 蓝泰致铭        on 15/4/27.
//  Copyright (c) 2015年 蓝泰致铭. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (mutiLine)

//多行显示
-(void)showFitText:(NSString*)text;

//添加点击自动关闭提示
-(void)addTapGesture;
@end

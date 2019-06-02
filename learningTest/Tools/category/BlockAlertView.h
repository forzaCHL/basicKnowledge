//
//  BlockAlertView.h
//  simpleAlertViewDemo
//
//  Created by 蓝泰致铭        on 15/4/13.
//  Copyright (c) 2015年 蓝泰致铭. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BlockAlertView;
typedef void (^TouchBlock)(NSInteger buttonIndex);

@interface BlockAlertView : UIAlertView

@property (nonatomic, copy) TouchBlock block;

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message block:(TouchBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;


@end

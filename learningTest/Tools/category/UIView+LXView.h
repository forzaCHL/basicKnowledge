//
//  UIView+LXView.h
//  
//
//  Created by apple on 15/12/18.
//  Copyright © 2015年 LXJenn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LXView)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
- (UIImage *)convertViewToImage;
@end

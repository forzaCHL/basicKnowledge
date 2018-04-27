//
//  BannerView.h
//  learningTest
//
//  Created by Apple on 2018/4/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerView : UIView

@property(nonatomic,strong)NSArray *dataArray;

-(instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;

@end

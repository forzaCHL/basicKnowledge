//
//  ViewControllerI.h
//  learningTest
//
//  Created by Apple on 2017/11/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^returnString) (NSString *str);

@interface ViewControllerI : UIViewController

@property(nonatomic,strong)returnString  strBlock;

@property (nonatomic, copy) void (^BlockII)(NSString * str);

@end

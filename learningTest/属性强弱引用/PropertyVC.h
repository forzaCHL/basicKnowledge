//
//  PropertyVC.h
//  learningTest
//
//  Created by Apple on 2018/3/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestVC.h"

@interface PropertyVC : UIViewController

@property(nonatomic,strong)TestVC *TestVCI;

@property(nonatomic,copy)TestVC *TestVCII;

@property(nonatomic,weak)TestVC *TestVCIII;

@property(nonatomic,assign)TestVC *TestVCIIII;

@end

//
//  BlockTestVC.h
//  learningTest
//
//  Created by Apple on 2017/11/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef int (^SumBlock) (int a,int b);

@interface BlockTestVC : UIViewController

@property(nonatomic,strong)SumBlock sumBlock;

@end

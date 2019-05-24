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

//block作为属性使用
@property(nonatomic,strong)SumBlock sumBlock;

//block作为方法使用

@property(nonatomic,strong)NSString *text;

@end

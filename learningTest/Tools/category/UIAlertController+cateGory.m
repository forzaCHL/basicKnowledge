//
//  UIAlertController+cateGory.m
//  learningTest
//
//  Created by Apple on 2019/5/24.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "UIAlertController+cateGory.h"

@implementation UIAlertController (cateGory)

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style cancleAction:(nonnull canCleBlock)cancle sureAction:(nonnull UIAlertAction *)sure{
    
    

    self = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    if (self) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        
        [self addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"sure1");
        }]];
        [self addAction:cancelAction];
    }
//    __weak typeof(self)weakSelf = self;
    return self;
}
-(void)setCancle:(canCleBlock)cancle{
    self.cancle = cancle;
}
-(canCleBlock)cancle{
    return self.cancle;
}

@end

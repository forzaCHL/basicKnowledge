//
//  BlockAlertView.m
//  simpleAlertViewDemo
//
//  Created by 蓝泰致铭        on 15/4/13.
//  Copyright (c) 2015年 蓝泰致铭. All rights reserved.
//

#import "BlockAlertView.h"

@implementation BlockAlertView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message block:(TouchBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    if (self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles: nil]) {
        if (otherButtonTitles) {
            
            va_list argumentList;
            va_start(argumentList, otherButtonTitles);
            
            NSString *string = nil;
            for (string = otherButtonTitles;
                 string != nil;
                 string = va_arg(argumentList, NSString*)) {
                [self addButtonWithTitle:string];
            }
            va_end(argumentList);
        }
        self.block = block;
    }
    return self;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    _block(buttonIndex);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  dog.h
//  learningTest
//
//  Created by Apple on 2019/3/4.
//  Copyright © 2019年 Apple. All rights reserved.
//
typedef NS_ENUM(NSInteger,MYENUM){
    first,
    sec,
};


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface dog : NSObject


+(void)eat;

-(void)sleep;

-(void)speak;

@property(nonatomic,strong)NSString *name;

@end

NS_ASSUME_NONNULL_END

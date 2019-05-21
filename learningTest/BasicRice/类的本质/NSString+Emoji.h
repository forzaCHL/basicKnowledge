//
//  NSString+Emoji.h
//  unittset
//
//  Created by 蓝泰致铭        on 15/1/23.
//  Copyright (c) 2015年 蓝泰致铭       . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Emoji)

//通过runtime设置分类属性
@property(nonatomic,strong)NSString *cateText;

+(BOOL)isContainsEmoji:(NSString *)string;

//实例方法必须有实现不然闪退
-(void)helpMe;

//类方法必须有实现不然闪退
+(void)helpYou;

-(void)clearAssociatedObject;
@end

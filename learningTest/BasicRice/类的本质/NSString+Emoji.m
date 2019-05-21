//
//  NSString+Emoji.m
//  unittset
//
//  Created by 蓝泰致铭        on 15/1/23.
//  Copyright (c) 2015年 蓝泰致铭       . All rights reserved.
//

#import "NSString+Emoji.h"

@implementation NSString (Emoji)

+(BOOL)isContainsEmoji:(NSString *)string {
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:0 error:nil];
    
    NSString *noEmojiStr = [regularExpression stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@""];
    
    if (![noEmojiStr isEqualToString:string]) {
        
        return YES;
    }
    return NO;
}
+(void)helpYou{
    NSLog(@"help you");
}
-(void)helpMe{
    NSLog(@"help me");
}
#pragma mark ----------- 属性方法
-(void)setCateText:(NSString *)cateText{
    /**
     1.给对象设置关联属性
     @param object 需要设置关联属性的对象，即给哪个对象关联属性
     @param key 关联属性对应的key，可通过key获取这个属性， key与关联属性一一对应，我们必须确保其全局唯一性，常用我们使用@selector(methodName)作为key。
     @param value 给关联属性设置的值
     @param policy 关联属性的存储策略(对应Property属性中的assign,copy，retain等)
     OBJC_ASSOCIATION_ASSIGN             @property(assign)。
     OBJC_ASSOCIATION_RETAIN_NONATOMIC   @property(strong, nonatomic)。
     OBJC_ASSOCIATION_COPY_NONATOMIC     @property(copy, nonatomic)。
     OBJC_ASSOCIATION_RETAIN             @property(strong,atomic)。
     OBJC_ASSOCIATION_COPY               @property(copy, atomic)。
     */
    objc_setAssociatedObject(self, @selector(cateText), cateText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)cateText{
    /**
     2.通过key获取关联的属性
     @param object 从哪个对象中获取关联属性
     @param key 关联属性对应的key
     @return 返回关联属性的值
     */
    return objc_getAssociatedObject(self, @selector(cateText));
}
//添加一个自定义方法，清楚对象的guan'kan关联属性
-(void)clearAssociatedObject{
    /**
     3.移除对象所关联的属性
     @param object 移除某个对象的所有关联属性
     */
    objc_removeAssociatedObjects(self);
}
@end

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

@end

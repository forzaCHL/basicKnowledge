//
//  Book.m
//  kvc-model-1
//
//  Created by 路国良 on 16/1/5.
//  Copyright © 2016年 baofoo. All rights reserved.
//

#import "Book.h"
@interface Book()

@end

@implementation Book
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(void)setValue:(id)value forKey:(NSString *)key{


    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"id"]) {
        key = @"id";
        [super setValue:value forKey:key];
    }
}
@end

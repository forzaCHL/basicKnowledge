//
//  DictModel.m
//  learningTest
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "DictModel.h"
#include "Author.h"



@implementation DictModel

-(id)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.age = [dict[@"age"] intValue];
        self.author = [[Author alloc] initWithDict:dict[@"author"]];
    }
    return self;
}
+(id)provinceWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
//kvc
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end

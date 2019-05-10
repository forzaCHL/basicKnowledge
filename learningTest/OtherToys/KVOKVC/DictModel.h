//
//  DictModel.h
//  learningTest
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Author;

@interface DictModel : NSObject

@property(nonatomic,strong)NSString *name;

@property(nonatomic,assign)int age;
@property(nonatomic,strong)Author*author;

-(id)initWithDict:(NSDictionary*)dict;
+(id)provinceWithDict:(NSDictionary*)dict;
@end

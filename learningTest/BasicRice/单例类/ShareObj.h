//
//  ShareObj.h
//  learningTest
//
//  Created by Apple on 2019/1/22.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "defineFile.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShareObj : NSObject

//+ (instancetype)sharedObj;

singleton_interface(ShareObj)

+ (instancetype)sharedObjtypeB;
//线程安全
//+ (instancetype)sharedObjtypeC;




@end

NS_ASSUME_NONNULL_END

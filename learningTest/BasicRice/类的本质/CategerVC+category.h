//
//  CategerVC+category.h
//  learningTest
//
//  Created by Apple on 2019/3/21.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "CategerVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface CategerVC (category)




//-(void)methods;


@end

NS_ASSUME_NONNULL_END
/**
 分类
 category 可以在不获悉，不改变原来代码的情况下往里面添加新的方法，只能添加，不能删除修改，并且如果类别和原来类中的方法产生名称冲突，则类别将覆盖原来的方法，因为类别具有更高的优先级。
 类别主要有3个作用：
 1).将类的实现分散到多个不同文件或多个不同框架中。
 2).创建对私有方法的前向引用。
 3).向对象添加非正式协议。
 
 
 new file--oc file--category
 
 */

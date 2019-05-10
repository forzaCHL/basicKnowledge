//
//  ViewControllerI.h
//  learningTest
//
//  Created by Apple on 2017/11/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^returnString) (NSString *str);

@interface ViewControllerI : UIViewController

//block作为属性使用
@property(nonatomic,strong)returnString  strBlock;

@property (nonatomic, copy) void (^BlockII)(NSString * str);



//block作为方法使用
+(void)blockclass:(returnString)block;

-(void)blckmtthod;

-(void)blockinfo:(returnString)block;

- (void)showblock:(void(^)(NSString*))block;


//Block作为返回值
- (void(^)(int))showblockii;

@end

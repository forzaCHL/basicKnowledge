//
//  dataViewController.m
//  learningTest
//
//  Created by Apple on 2019/3/1.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "dataViewController.h"
#import "reamldog.h"

@interface dataViewController ()

@end

@implementation dataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 100, 100, 40);
    [button setTitle:@"增" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(addObjects) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(150, 100, 100, 40);
    [button2 setTitle:@"删" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor orangeColor];
    [button2 addTarget:self action:@selector(removeObjects) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(20, 200, 100, 40);
    [button3 setTitle:@"改" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor orangeColor];
    [button3 addTarget:self action:@selector(changeObjects) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(150, 200, 100, 40);
    [button4 setTitle:@"查" forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor orangeColor];
    [button4 addTarget:self action:@selector(searchObjects) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
//沙盒
//    Document文件夹：用来保存应由程序运行时生成的需要持久化的数据
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    Library文件夹：用来存储程序的默认设置和其他状态信息
//    Library/Caches:用来存放缓存文件，iTunes不会备份此目录，此目录下的文件不会在程序退出后删除，一般存放体积比较大但又不太重要的文件
//    Library/Preferences:  (NSUserDefaults)
//    用来存储用户的偏好设置，iOS的setting（设置）会在这个目录中查找应用程序的设置信息，iTunes会自动备份该目录，通常这个文件夹都是由系统进行维护的，建议不要操作他。
//    系统没有直接获取这个文件夹路径的方法,需要先获取Library路径然后进行字符串拼接找到此路径:
    NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
//    tmp：保存应用程序的临时文件夹，使用完毕后，将相应的文件从这个目录中删除，如果空间不够，系统也可能会删除这个目录下的文件
    NSString *tmpPath = NSTemporaryDirectory();

    NSLog(@"docPath %@   libraryPath  %@  tmpPath  %@",docPath,libraryPath,tmpPath);
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@"admin"forKey:@"user_name"];
    [userDefault synchronize];//强制立即将数据写入磁


}
-(void)addObjects{
    [self reaml];
}
-(void)removeObjects{
    //获取Realm对象
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    //根据条件删除一条数据
    RLMResults *results = [reamldog objectsWhere:@"name = 'abc'"];
    reamldog *titan1 = results.firstObject;
    
    // 删除单条记录
    [realm transactionWithBlock:^{
        [realm deleteObject:titan1];
    }];
    
    
    
    //删除所有符合条件的数据
    RLMResults *resultii = [reamldog objectsWhere:@"name = 'bcd'"];
    for (reamldog *stu in resultii) {
        [realm transactionWithBlock:^{
            [realm deleteObject:stu];
        }];
    }
    NSLog(@"删除个别后 %@",resultii);
    
    
    //删除表中所有的数据
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
}
-(void)changeObjects{
    RLMRealm *realm = [RLMRealm defaultRealm];
    reamldog *dog1 = [[reamldog alloc]initWithValue:@[@"changedog",@1]];
    [realm transactionWithBlock:^{
        [realm addObject:dog1];
    }];
    // 这里修改的模型, 一定是被realm所管理的模型
    [realm transactionWithBlock:^{
        dog1.name = @"changed";
    }];
}
-(void)searchObjects{
    ////    四、查询
    ////    余量查询

    RLMResults *results = [reamldog allObjects];
    NSLog(@"1所有的数据  %@",results);
    
    //    条件查询
    RLMResults *resultii = [reamldog objectsWhere:@"age = 33"];
    NSLog(@"条件查询 %@",resultii);
}
#pragma mark ----------- reaml
-(void)reaml{
//    一、初始化对象
//    数组对象
    reamldog *dog1 = [[reamldog alloc]initWithValue:@[@"abc",@1]];
//    键值对字典
    reamldog *dog2 = [[reamldog alloc]initWithValue:@{@"name":@"bcd",@"age":@2}];
//    属性赋值
    reamldog *dog3 = [[reamldog alloc]init];
    dog3.name = @"cde";
    dog3.age = 3;
    
//    二、储存操作
    //方式一: 提交事务处理
    //获取Realm对象
    RLMRealm *realm = [RLMRealm defaultRealm];
    //开始写入事务
    [realm beginWriteTransaction];
    //添加模型对象
    [realm addObject:dog1];
    //提交写入事务
    [realm commitWriteTransaction];
    
    
    //方式二: 在事务中调用addObject:方法
    RLMRealm *realm2 = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm2 addObject:dog2];
    }];
    
    
    //方式三: 在十五中创建新的对象并添加
    [realm transactionWithBlock:^{
        //添加模型
        [reamldog createInRealm:realm withValue:@{@"age": @33, @"name":@"efg"}];
    }];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:@"user_name"];
    NSLog(@"name -->%@",name);
}
#pragma mark -----------nsuserdefault
-(void)nsuserdefault{
//    NSUserDefaults *
}
@end

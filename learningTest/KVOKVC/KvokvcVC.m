//
//  KvokvcVC.m
//  learningTest
//
//  Created by Apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "KvokvcVC.h"
#import "Dog.h"
#import "TestVC.h"
#import "Master.h"
#import "DictModel.h"
#import "Author.h"
#import "Book.h"
@interface KvokvcVC (){
    Dog *myDog;
}

@end

@implementation KvokvcVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self KVCMethod];
    [self KVOMethod];
}
-(void)KVCMethod{
    /**
     KVC 有两个方法：一个是设置 key 的值，另一个是获取 key 的值
     1>基本取值赋值
     */
    Dog *dog = [[Dog alloc]init];
    Master *master = [Master new];
    NSString *originalNamei = @"lily";
    [dog setName:originalNamei];
    
    // using the KVC accessor (getter) method
    NSString *originalName = [dog valueForKey:@"name"];
    
    // using the KVC  accessor (setter) method.
    NSString *newName = @"LILY";
    [dog setValue:newName forKey:@"name"];
    NSLog(@"基础赋值取值-->Changed %@'s name to: %@", originalName, newName);
    /**
     键值嵌套 keyPath
     */
    [dog setValue:master forKey:@"master"];
    [dog setValue:@"misiro" forKeyPath:@"master.name"];
    NSLog(@"键值嵌套-->%@",[dog valueForKeyPath:@"master.name"]);
    /**
     装箱拆箱
     装箱:把值类型转换成引用类型  若是int 转换成NSNumer或者NSString
     拆箱:将引用类型转换成值类型
     */
    [dog setValue:@18 forKey:@"age"];
    NSLog(@"装箱拆箱-->dog`s age is %@",[dog valueForKey:@"age"]);
    /**
     KVC 还可以对NSArray和NSSet 进行赋值
     */
//    获取数组里的,最大、最小、平均、求和
    
    NSArray *array = @[@"10",@"35",@72,@78,@"1"];
    NSNumber *sum = [array valueForKeyPath:@"@sum.floatValue"];
    NSNumber *avg = [array valueForKeyPath:@"@avg.floatValue"];
    NSNumber *max = [array valueForKeyPath:@"@max.floatValue"];
    NSNumber *min = [array valueForKeyPath:@"@min.floatValue"];
    NSLog(@"KVC数组操作1-->求和%@  平均%@  最大%@  最小%@",sum,avg,max,min);
    
    NSArray *arrays = @[@"name", @"w", @"aa", @"zxp", @"aa"]; //返回的是一个新的数组
    NSArray *newArray = [arrays valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"KVC数组操作2-->删除重复数据%@", newArray);
    /**
     字典转模型
     */
    NSDictionary*dic = @{@"name":@"chenhailin",@"age":@11,@"author":@{@"name":@"huabei"}};
    DictModel*model = [[DictModel alloc] initWithDict:dic];
    NSLog(@"KVC字典转模型1-->model.name %@  model.age %d  model.author.name%@",model.name,model.age,model.author.name);
    
    NSDictionary*dict = @{@"bookName":@"陈大哥",@"pubHouse":@"豪宅",@"price":[NSNumber numberWithInt:20],@"id":@"19",@"author":@{@"name":@"json"}};
    Book*book = [[Book alloc] init];
    [book setValuesForKeysWithDictionary:dict];
    NSLog(@"KVC字典转模型2-->book.bookName = %@ book.pubHouse = %@ book.id = %@",book.bookName,book.pubHouse,book.id);
    /**
     给私有属性赋值
     */
    [dog setValue:@888888 forKey:@"money"];
    [dog showMsg];
}
-(void)KVOMethod{
    myDog = [Dog new];
    [myDog addObserver:self forKeyPath:@"age"options:NSKeyValueObservingOptionNew context:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [myDog setValue:@22 forKey:@"age"];
    NSLog(@"set dog age= %@", [myDog valueForKey:@"age"]);
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"warning!!! age is changed! newValue is %@", [change valueForKey:NSKeyValueChangeNewKey]);
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    [myDog removeObserver:self forKeyPath:@"age" context:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

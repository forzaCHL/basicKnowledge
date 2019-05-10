//
//  BasicVC.m
//  learningTest
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BasicVC.h"
#import "delayVC.h"
#import "ShareObj.h"
#import "defineFile.h"
#import "AlgorithmViewController.h"
#import "JSWebViewController.h"
#import "OCCallJSViewController.h"
#import "QiViewController.h"
#import "LianshiViewController.h"
#import "dataViewController.h"
#import "dog.h"

@interface BasicVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *array;
@end

@implementation BasicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Basic things";
    self.navigationController.navigationBar.translucent = YES;
    _array = [[NSArray alloc]initWithObjects:@"正则判断",@"Http",@"Block",@"CoreData",@"frame和bounds",@"GCD",@"Runtime",@"UIViewAnimation",@"导航栏细线",@"属性强弱引用",@"排序",@"文字高度",@"NSAssert",@"类的本质",@"静态库制作与使用",@"定时任务",@"基础面试",@"算法排序", @"JScallOC",@"OCcallJS",@"卡片",@"链式编程",@"数据储存",nil];
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 44;
    [self.view addSubview:_tableView];
    [_tableView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    __weak typeof(self) weakSelf = self;


    
    
    
}
/* mak
 * 异步执行 + 并发队列\\\\  \  ``
 * 特点：可以开启多个线程，任务交替（同时）执行。
 */
-(void)asyncConcurrent{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("shareObj", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 11; ++i) {
//            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
            ShareObj *obj4 = [ShareObj sharedObjtypeB];
            NSLog(@"obj4%@",obj4);
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 11; ++i) {
//            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
            ShareObj *obj4 = [ShareObj sharedObjtypeB];
            NSLog(@"obj4%@",obj4);
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 1111; ++i) {
//            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
            ShareObj *obj4 = [ShareObj sharedObjtypeB];
            NSLog(@"obj4%@",obj4);
        }
    });
    
    NSLog(@"asyncConcurrent---end");
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"basic";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *title = cell.textLabel.text;
    if ([title isEqualToString:@"正则判断"]) {
        TestVC *vc = [TestVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"Http"]){
        HTTPRequestVC *vc = [HTTPRequestVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"Block"]){
        BlockTestVC *vc = [BlockTestVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"CoreData"]){
        [UIShowTool showNormalyTextViewInWindowAndtext:@"not yet"];
    }else if ([title isEqualToString:@"frame和bounds"]){
        UIViewFrame *vc = [UIViewFrame new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"GCD"]){
        GCDVC *vc = [GCDVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"Runtime"]){
        RuntimeVC *vc = [RuntimeVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"UIViewAnimation"]){
        UIViewAnimationVC *vc = [UIViewAnimationVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"导航栏细线"]){
        NavViewController *vc = [NavViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"属性强弱引用"]){
        PropertyVC *vc = [PropertyVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"排序"]){
        TestVC *vc = [TestVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"文字高度"]){
        GetTextHeight *vc = [GetTextHeight new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"NSAssert"]){
        AssertVC *vc = [AssertVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"类的本质"]){
        CategerVC *vc = [CategerVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"静态库制作与使用"]){
        StaticLibraryVC *vc = [StaticLibraryVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"定时任务"]){
        delayVC *vc = [delayVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"基础面试"]){
        OperationViewController *vc = [OperationViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"算法排序"]){
        AlgorithmViewController *vc = [AlgorithmViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"JScallOC"]){
        JSWebViewController *vc = [JSWebViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"OCcallJS"]){
        OCCallJSViewController *vc = [OCCallJSViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"卡片"]){
        QiViewController *vc = [QiViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"链式编程"]){
        LianshiViewController *vc = [LianshiViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"数据储存"]){
        dataViewController *vc = [dataViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end

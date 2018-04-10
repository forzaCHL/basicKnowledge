//
//  BasicVC.m
//  learningTest
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BasicVC.h"
#import "delayVC.h"

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
    _array = [[NSArray alloc]initWithObjects:@"正则判断",@"Http",@"Block",@"CoreData",@"frame和bounds",@"GCD",@"Runtime",@"UIViewAnimation",@"导航栏细线",@"属性强弱引用",@"排序",@"文字高度",@"NSAssert",@"类的本质",@"静态库制作与使用",@"定时任务", nil];
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 44;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
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
    }
}
@end

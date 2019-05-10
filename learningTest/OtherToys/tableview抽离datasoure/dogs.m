//
//  dogs.m
//  learningTest
//
//  Created by Apple on 2019/5/10.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "dogs.h"
#import "ArrayDataSource.h"
#import "dogObj.h"
#import "dogTableViewCell.h"

static NSString * const cellIdentifier = @"dogCell";

@interface dogs ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;

@property (nonatomic, strong) UITableView *tabView;



@end

@implementation dogs

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTabview];
}
-(void)setTabview{
    dogObj *dog1 = [[dogObj alloc]init];
    dog1.name = @"C1";
    
    dogObj *dog2 = [[dogObj alloc]init];
    dog2.name = @"C2";
    
    dogObj *dog3 = [[dogObj alloc]init];
    dog3.name = @"C3";
    NSArray *dogList = [[NSArray alloc]initWithObjects:dog1,dog2,dog3, nil];
    
    TableViewCellConfigureBlock configureCell = ^(dogTableViewCell *cell, dogObj *obj) {
        [cell configurationWithModel:obj];
    };
    self.tabView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tabView.rowHeight = 40;
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:dogList
                                                         cellIdentifier:cellIdentifier
                                                     configureCellBlock:configureCell];
    self.tabView.dataSource = self.photosArrayDataSource;
    self.tabView.delegate = self;
    [self.tabView registerClass:[dogTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:self.tabView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

@end

//
//  cats.m
//  learningTest
//
//  Created by Apple on 2019/5/10.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "cats.h"
#import "ArrayDataSource.h"
#import "catObj.h"
#import "catTableViewCell.h"

static NSString * const cellIdentifier = @"catCell";

@interface cats ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ArrayDataSource *arrayDataSource;

@property (nonatomic, strong) UITableView *tabView;



@end

@implementation cats

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTabview];
}
-(void)setTabview{
    NSArray *dogList = [self getList];
    
    TableViewCellConfigureBlock configureCell = ^(catTableViewCell *cell, catObj *obj) {
        [cell configurationWithModel:obj];
    };
    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height-80) style:UITableViewStylePlain];
    self.tabView.rowHeight = 50;
    self.arrayDataSource = [[ArrayDataSource alloc] initWithItems:dogList
                                                         cellIdentifier:cellIdentifier
                                                     configureCellBlock:configureCell];
    self.tabView.dataSource = self.arrayDataSource;
    self.tabView.delegate = self;
    [self.tabView registerClass:[catTableViewCell class] forCellReuseIdentifier:cellIdentifier];
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
-(NSArray *)getList{
    catObj *cat1 = [[catObj alloc]init];
    cat1.name = @"C1";
    cat1.content = @"C11C";
    
    catObj *cat2 = [[catObj alloc]init];
    cat2.name = @"C2";
    cat2.content = @"C22C";
    
    catObj *cat3 = [[catObj alloc]init];
    cat3.name = @"C3";
    cat3.content = @"C33C";
    
    catObj *cat4 = [[catObj alloc]init];
    cat4.name = @"cat4";
    cat4.content = @"cat44";
    
    catObj *cat5 = [[catObj alloc]init];
    cat5.name = @"cat5";
    cat5.content = @"cat55";
    
    catObj *cat6 = [[catObj alloc]init];
    cat6.name = @"cat6";
    cat6.content = @"cat66";
    
    catObj *cat7 = [[catObj alloc]init];
    cat7.name = @"cat7";
    cat7.content = @"cat77";
    
    catObj *cat8 = [[catObj alloc]init];
    cat8.name = @"cat8";
    cat8.content = @"cat88";
    
    catObj *cat9 = [[catObj alloc]init];
    cat9.name = @"cat9";
    cat9.content = @"cat99";
    
    catObj *cat10 = [[catObj alloc]init];
    cat10.name = @"cat10";
    cat10.content = @"cat100";
    
    catObj *cat11 = [[catObj alloc]init];
    cat11.name = @"cat11";
    cat11.content = @"cat111";
    
    catObj *cat12 = [[catObj alloc]init];
    cat12.name = @"cat12";
    cat12.content = @"cat122";
    
    catObj *cat13 = [[catObj alloc]init];
    cat13.name = @"cat13";
    cat13.content = @"cat133";
    
    catObj *cat14= [[catObj alloc]init];
    cat14.name = @"cat14";
    cat14.content = @"cat144";
    
    catObj *cat15 = [[catObj alloc]init];
    cat15.name = @"cat15";
    cat15.content = @"cat155";
    
    catObj *cat16 = [[catObj alloc]init];
    cat16.name = @"cat16";
    cat16.content = @"cat166";
    
    catObj *cat17= [[catObj alloc]init];
    cat17.name = @"cat17";
    cat17.content = @"cat177";
    
    catObj *cat18 = [[catObj alloc]init];
    cat18.name = @"cat18";
    cat18.content = @"cat188";
    
    NSArray *catList = [[NSArray alloc]initWithObjects:cat1,cat2,cat3,cat4,cat5,cat6,cat7,cat8,cat9,cat10,cat11,cat12,cat13,cat14,cat15,cat16,cat7,cat18, nil];
    return catList;
}

@end

//
//  UIViewFrame.m
//  learningTest
//
//  Created by Apple on 2018/3/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIViewFrame.h"
#import "UIAlertController+cateGory.m"
@interface UIViewFrame ()<UIAlertViewDelegate>

@end

@implementation UIViewFrame

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
/**
frame是相对父视图位置 bounds是相对自己的位置
*/
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    UIView *viewi = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    viewi.backgroundColor = [UIColor yellowColor];
    [view addSubview:viewi];
    
    NSLog(@"view frame%@  bounds%@",NSStringFromCGRect(view.frame),NSStringFromCGRect(view.bounds));
    NSLog(@"viewi frame%@  bounds%@",NSStringFromCGRect(viewi.frame),NSStringFromCGRect(viewi.bounds));
    
    [self categoryUI];
    
    
    
}
#pragma mark ----------- category类创建的UI视图
-(void)categoryUI{
    UILabel *cateLab = [[UILabel alloc]initWithFont:[UIFont systemFontOfSize:15] textColor:[UIColor redColor]];
    cateLab.numberOfLines = 0;
    cateLab.text = @"1、frame不管对于位置还是大小，改变的都是自己本身\n2、frame的位置是以父视图的坐标系为参照，从而确定当前视图在父视图中的位置\n3、frame的大小改变时，当前视图的左上角位置不会发生改变，只是大小发生改变\n2、bounds改变位置时，改变的是子视图的位置，自身没有影响；其实就是改变了本身的坐标系原点，默认本身坐标系的原点是左上角\n3、bounds的大小改变时，当前视图的中心点不会发生改变，当前视图的大小发生改变，看起来效果就想缩放一样";
    cateLab.frame = CGRectMake(0, 200, 300, 300);
    [self.view addSubview:cateLab];
    
    
    UIButton *cateBut = [[UIButton alloc]initWithTitle:@"cateBut" titleFont:[UIFont systemFontOfSize:17] titleColor:[UIColor greenColor] touchBlock:^{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"cateAlert" message:@"cateUI" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", @"好的",nil];
        [alert show];
    }];
    cateBut.frame = CGRectMake(0, 520, 300, 40);
    [self.view addSubview:cateBut];
}
-(void)showAlert{
    UIAlertController *alert = [[UIAlertController alloc]initWithTitle:@"category" message:@"UIAlertController" style:UIAlertControllerStyleAlert];
//    alert.cancle = ^(NSString * _Nonnull action) {
//        NSLog(@"action %@",action);
//    };
//    alert.sure = ^(NSString * _Nonnull action) {
//
//    };
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   [self showAlert];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"index %ld",buttonIndex);
}
@end

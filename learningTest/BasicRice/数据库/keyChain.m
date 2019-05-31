//
//  keyChain.m
//  learningTest
//
//  Created by Apple on 2019/5/29.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "keyChain.h"
#import "YYKeychain.h"
#import <Security/Security.h>

@interface keyChain ()

@end

@implementation keyChain

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"keyChain";
    NSArray *title = [[NSArray alloc]initWithObjects:@"setValue",@"getValue",@"deleVaule", nil];
    for (int i = 0; i<title.count; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(i*110, 100, 100, 40);
        [but setTitle:title[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        but.tag = 100+i;
        [but addTarget:self action:@selector(methords:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:but];
    }
}
-(void)methords:(UIButton *)but{
    NSInteger tag = but.tag;
    switch (tag) {
        case 100:
            [self setKeyChain];
            break;
        case 101:
            [self getKayChain];
            break;
        case 102:
            [self deleKeyChain];
            break;
        default:
            break;
    }
}
//KeyChain
-(void)setKeyChain{
    NSString *pwd = @"chen123";
    NSString *service = @"learn";
    NSString *service2 = @"dhyx";
    NSString *pwd2 = @"chen1234";
    NSString *account = @"chen";
    [YYKeychain setPassword:pwd forService:service account:account];
    [YYKeychain setPassword:pwd2 forService:service2 account:account error:nil];
}
-(void)getKayChain{
    NSString *pwd = [YYKeychain getPasswordForService:@"learn" account:@"chen"];
    NSString *pwd2 = [YYKeychain getPasswordForService:@"dhyx" account:@"chen" error:nil];
    NSLog(@"--pwd %@ -- pwd2 %@",pwd,pwd2);
}
-(void)deleKeyChain{
    [YYKeychain deletePasswordForService:@"learn" account:@"chen"];
    [YYKeychain deletePasswordForService:@"dhyx" account:@"chen" error:nil];
}
@end

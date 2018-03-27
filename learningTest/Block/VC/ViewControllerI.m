//
//  ViewControllerI.m
//  learningTest
//
//  Created by Apple on 2017/11/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewControllerI.h"

@interface ViewControllerI ()<UITextViewDelegate>

@property(nonatomic,strong)UITextView  *myText;

@end

@implementation ViewControllerI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self setTextView];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.strBlock) {
        self.strBlock(@"return me");
    }
}
-(void)setTextView{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 120, 280, 150)];
    textView.font = [UIFont systemFontOfSize:15.f];
    textView.layer.masksToBounds = YES;
    textView.layer.cornerRadius = 4.f;
//    textView.editable = NO;
    textView.layer.masksToBounds = YES;
    [self.view addSubview:textView];
    self.myText = textView;
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"textViewDidBeginEditing");
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"textViewDidEndEditing");
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"textViewShouldEndEditing");
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.myText resignFirstResponder];
}
@end
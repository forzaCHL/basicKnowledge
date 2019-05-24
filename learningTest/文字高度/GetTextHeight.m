//
//  GetTextHeight.m
//  learningTest
//
//  Created by Apple on 2017/10/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "GetTextHeight.h"

@interface GetTextHeight ()

@end

@implementation GetTextHeight

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str = @"我的发小苏禾是兜兜转转一圈后，<br>\n嫁给梁凯的。\n我的发小苏禾是兜兜转转一圈后，嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。\n嫁给梁凯的。123456789qwertyuioplkjhgfdsazxcvbnm";
    CGFloat hei = [self getHeight:str andWide:self.view.frame.size.width];
//    CGFloat width =
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, hei)];
    lab.backgroundColor = [UIColor orangeColor];
    lab.font = [UIFont systemFontOfSize:15];
    lab.text = str;
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(CGFloat)getHeight:(NSString *)text andWide:(CGFloat)wide{
    
   CGSize strSize = [text boundingRectWithSize:CGSizeMake(wide, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    return strSize.height;
}
#pragma mark ----------- 过滤html标签后计算文字高度
-(CGFloat)getTextHeight:(NSString *)text{
    //    过滤HTML标签
    NSString *descriptionStr = text ? text:@"暂无培训简介";
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[descriptionStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    NSString *string = [attrStr string];
    
    
    CGSize titleSize = [string boundingRectWithSize:CGSizeMake(320, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    return titleSize.height;
}
-(CGFloat)heightForText:(NSString *)text font:(UIFont*)font maxWidth:(CGFloat)maxWidth
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, maxWidth, CGFLOAT_MAX)];
    label.font = font;
    label.text = text;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label.frame.size.height;
}
@end

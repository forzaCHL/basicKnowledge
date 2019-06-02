//
//  UILabel+ZXYCategory.m
//  CloudStudy
//
//  Created by 蓝泰致铭        on 2017/1/3.
//  Copyright © 2017年 蓝泰致铭. All rights reserved.
//

#import "UILabel+ZXYCategory.h"

@implementation UILabel (ZXYCategory)

- (instancetype)initWithFont:(UIFont*)font textColor:(UIColor*)textColor{
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        if (font) {
            self.font = font;
        }
        if (textColor) {
            self.textColor = textColor;
        }
    }
    
    return self;
}

- (CGFloat)numberOfText {
    // 获取单行时候的内容的size
    CGSize singleSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    // 获取多行时候,文字的size
    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    // 返回计算的行数
    return ceil( textSize.height / singleSize.height);
}

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}

-(CGFloat)heightForContent{
    
    CGFloat height = [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.height;
    
    self.backgroundColor = [UIColor clearColor];
    self.numberOfLines = 0;
    
    if (height > 0) {
        
        CGRect rect = self.frame;
        rect.size.height = height;
        
        [self setFrame:rect];
        return height;
    }else{
        CGRect rect = self.frame;
        rect.size.height = self.font.xHeight;
        
        [self setFrame:rect];
        return height;
    }
}

-(CGFloat)widthForContent{
    
    CGFloat width = [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.font.xHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.width;
    
    return MAX(30, width);
}

@end

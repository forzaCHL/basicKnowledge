//
//  MyCollectionViewCell.m
//  learningTest
//
//  Created by Apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _topImage  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        [self.contentView addSubview:_topImage];
        _topImage.image = [UIImage imageNamed:@"account_normal"];
        
        _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 70, 30)];
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.numberOfLines = 0;
        _botlabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_botlabel];
    }
    
    return self;
}
@end

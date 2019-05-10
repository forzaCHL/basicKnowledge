//
//  catTableViewCell.m
//  learningTest
//
//  Created by Apple on 2019/5/10.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "catTableViewCell.h"

@implementation catTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        
        _titlelab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        _titlelab.font      = [UIFont systemFontOfSize:15];
        _titlelab.textColor = [UIColor redColor];
        _titlelab.backgroundColor = [UIColor clearColor];
        _titlelab.textAlignment   = NSTextAlignmentLeft;
        [self.contentView addSubview:_titlelab];
        
        _contentlab = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, 20)];
        _contentlab.font = [UIFont systemFontOfSize:12];
        _contentlab.textColor = [UIColor blueColor];
        _contentlab.backgroundColor = [UIColor clearColor];
        _contentlab.numberOfLines = 0;
        _contentlab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_contentlab];
    }
    return self;
}

-(void)configurationWithModel:(catObj *)model {
    _titlelab.text = model.name;
    _contentlab.text = model.content;
}

@end

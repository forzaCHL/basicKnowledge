//
//  dogTableViewCell.m
//  learningTest
//
//  Created by Apple on 2019/5/10.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "dogTableViewCell.h"

@implementation dogTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        _titlelab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        _titlelab.font      = [UIFont systemFontOfSize:15];
        _titlelab.textColor = [UIColor redColor];
        _titlelab.backgroundColor = [UIColor clearColor];
        _titlelab.textAlignment   = NSTextAlignmentLeft;
        [self.contentView addSubview:_titlelab];
        
        
    }
    return self;
}

-(void)configurationWithModel:(dogObj *)model {
    _titlelab.text = model.name;
}

@end

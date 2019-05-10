//
//  catTableViewCell.h
//  learningTest
//
//  Created by Apple on 2019/5/10.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "catObj.h"

@interface catTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel     * titlelab;
@property (nonatomic, strong) UILabel     * contentlab;

-(void)configurationWithModel:(catObj *)model;
@end

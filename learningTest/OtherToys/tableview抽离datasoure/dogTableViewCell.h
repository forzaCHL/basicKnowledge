//
//  dogTableViewCell.h
//  learningTest
//
//  Created by Apple on 2019/5/10.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dogObj.h"
@interface dogTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel     * titlelab;
@property (nonatomic, strong) UILabel     * contentlab;

-(void)configurationWithModel:(dogObj *)model;

@end

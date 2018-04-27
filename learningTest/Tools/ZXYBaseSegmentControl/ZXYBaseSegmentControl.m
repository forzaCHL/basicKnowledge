//
//  TopBarContentView.m
//  CloudStudyPeiban
//
//  Created by pro2 on 16/5/17.
//  Copyright © 2016年 netschina. All rights reserved.
//

#import "ZXYBaseSegmentControl.h"

@interface ZXYBaseSegmentControl ()

@property (weak, nonatomic  ) UIImageView *indicatorView;
@property (weak, nonatomic  ) UIButton    *selectedButton;
@property (weak, nonatomic  ) UIImageView *shadowImage;
@property (strong, nonatomic) UIButton    *defaultButton;
@property (assign, nonatomic) CGFloat     btnW;
@property (nonatomic, strong) NSMutableArray * segnmentBtns;

@end

@implementation ZXYBaseSegmentControl

- (NSMutableArray *)segnmentBtns {
    if(!_segnmentBtns) {
        _segnmentBtns = [NSMutableArray array];
    }
    return _segnmentBtns;
}

- (void)createView
{
    self.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self)weakSelf = self;
    //底部的线
    UIView * bottomLine = [UIView new];
    bottomLine.backgroundColor = RGB(214, 214, 214);
    [self addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(weakSelf);
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.height.mas_equalTo(@(2));
    }];
    
    [self initWithSegments];
    
    UIImageView *indicatorView = [[UIImageView alloc] init];
    [self addSubview:indicatorView];
    self.indicatorView = indicatorView;
    indicatorView.backgroundColor = [UIColor redColor];
    self.btnW = [UIScreen mainScreen].bounds.size.width / self.titlesArray.count;
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.btnW * self.defaultButton.tag);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(self.mas_width).multipliedBy(1.f / self.titlesArray.count);
        make.height.equalTo(@(1.5));
    }];
    [self topBarButtonClick:self.defaultButton];
}

- (void)initWithSegments{
    
    UIButton *firstButton;
    for (int i = 0; i < self.titlesArray.count; i++) {
        
        UIButton *topBarButton = [[UIButton alloc] init];
        topBarButton.tag = i;
        [topBarButton setTitle:self.titlesArray[i] forState:UIControlStateNormal];
        [topBarButton setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        
        topBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [topBarButton addTarget:self action:@selector(topBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:topBarButton];
        
        [topBarButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.mas_width).multipliedBy(1.f / self.titlesArray.count);
            make.height.equalTo(self.mas_height);
            make.top.equalTo(self.mas_top);
            firstButton ? make.left.equalTo(firstButton.mas_right) : make.left.equalTo(self.mas_left);
        }];
        firstButton = topBarButton;
        
        [self.segnmentBtns addObject:topBarButton];
        
        if (self.defaultSelected > self.titlesArray.count) {
            self.defaultSelected = 0;
        }
        if (i == (self.defaultSelected ? self.defaultSelected : 0)) {
            self.defaultButton = topBarButton;
        }
    }
}

- (void)setTitlesArray:(NSArray *)titlesArray{
    
    _titlesArray = [NSArray arrayWithArray:titlesArray];
    for (UIButton *button in self.segnmentBtns) {
        
        [button removeFromSuperview];
    }
    [self.segnmentBtns removeAllObjects];
    [self initWithSegments];
}


- (void)topBarButtonClick:(UIButton *)button
{
    self.currentSelectedIndex = button.tag;
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    for(UIButton * btn in self.segnmentBtns) {
        if(btn == button) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    if (button == self.defaultButton) {
        self.defaultButton = nil;
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            [self layoutIfNeeded];
        }];
    }
    
    if ([self.delegate respondsToSelector:@selector(segmentControlWithButtonClickIndex:)]) {
        [self.delegate segmentControlWithButtonClickIndex:button.tag];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentControl:withButtonClickIndex:)]) {
        [self.delegate segmentControl:self withButtonClickIndex:button.tag];
    }
}

- (void)setCurrentSelectedIndex:(NSInteger)currentSelectedIndex
{
    for(UIButton * btn in self.segnmentBtns) {
        if(btn.tag == currentSelectedIndex) {
            self.selectedButton = btn;
            btn.enabled         = false;
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            btn.enabled         = true;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateCurrentIndicatorWithIndex:(NSInteger)currentSelectedIndex {
    UIButton * btn = (UIButton *)[self.segnmentBtns objectAtIndex:currentSelectedIndex];
    [self topBarButtonClick:btn];
}

- (void)updateConstraints
{
    [self.indicatorView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.selectedButton.tag * self.btnW);
    }];
    
    [super updateConstraints];
}
@end

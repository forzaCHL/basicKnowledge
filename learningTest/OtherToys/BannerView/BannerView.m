//
//  BannerView.m
//  learningTest
//
//  Created by Apple on 2018/4/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BannerView.h"

@interface BannerView()<UIScrollViewDelegate>

@property(nonatomic,strong)NSTimer *timer;


@property(nonatomic,weak)UIScrollView *scroView;


@end

@implementation BannerView


-(void)dealloc{
    _scroView = nil;
}
-(instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray{
    if(self = [super initWithFrame:frame]){
        self.dataArray = dataArray;
        [self setupViews];
    }
    return self;
}
-(void)setupViews{
    UIScrollView *scroView = [[UIScrollView alloc]init];
    scroView.frame = CGRectMake(0, 0, kScreenWidth, self.frame.size.height);
    scroView.showsVerticalScrollIndicator = NO;
    scroView.showsHorizontalScrollIndicator = NO;
    scroView.contentSize = CGSizeMake(kScreenWidth*self.dataArray.count, self.frame.size.height);
    scroView.pagingEnabled = YES;
    scroView.delegate      = self;
    scroView.bounces = NO;
    [self addSubview:scroView];
//    [scroView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.top.equalTo(self);
//    }];
    self.scroView = scroView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bannerImgTap:)];
    
    for (int i = 0; i<self.dataArray.count; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, self.frame.size.height)];
        img.image = [UIImage imageNamed:self.dataArray[i]];
//        img.autoresizingMask= UIViewAutoresizingFlexibleWidth;
        img.contentMode= UIViewContentModeScaleAspectFit;
        img.userInteractionEnabled = YES;
        [img addGestureRecognizer:tap];
        img.tag = 100+i;
        [self.scroView addSubview:img];
    }
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(bannerMove) userInfo:nil repeats:YES];
}
-(void)bannerImgTap:(UITapGestureRecognizer *)tap{
    NSInteger tag = tap.view.tag;
    NSLog(@"tap--%ld",tag);
}
-(void)bannerMove{
    
}
#pragma mark - UIScrollView Delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //开始拖动scrollview的时候 停止计时器控制的跳转
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    CGFloat x = scrollView.contentOffset.x;
    NSLog(@"----%f",x);
    if (x >= kScreenWidth*(self.dataArray.count-1)) {
        [scrollView setContentOffset:CGPointMake(0, 0)];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}
@end

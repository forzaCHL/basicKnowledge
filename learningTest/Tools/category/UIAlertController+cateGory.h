//http://www.cocoachina.com/ios/20170102/18502.html

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^canCleBlock)(void);

//typedef void (^TouchBlock)(NSInteger buttonIndex);

@interface UIAlertController (cateGory)


@property(nonatomic,copy)canCleBlock cancle;
//@property (nonatomic, copy) TouchBlock block;

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style cancleAction:(canCleBlock)cancle sureAction:(UIAlertAction *)sure;


@end

NS_ASSUME_NONNULL_END

//http://www.cocoachina.com/ios/20170102/18502.html

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//取消按钮回调
typedef void(^canCleBlock)(NSString *action);
//确定按钮回调
typedef void(^sureBlock)(NSString *action);

@interface UIAlertController (cateGory)

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style;


@property(nonatomic,copy)canCleBlock cancle;

@property(nonatomic,copy)sureBlock sure;


@end

NS_ASSUME_NONNULL_END

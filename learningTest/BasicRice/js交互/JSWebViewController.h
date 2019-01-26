//
//  JSWebViewController.h
//  learningTest
//
//  Created by Apple on 2019/1/26.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


NS_ASSUME_NONNULL_BEGIN

@protocol TestJSExport <JSExport>
JSExportAs
(calculateForJS  /** handleFactorialCalculateWithNumber 作为js方法的别名 */,
 - (void)handleFactorialCalculateWithNumber:(NSNumber *)number
 );
- (void)pushViewController:(NSString *)view title:(NSString *)title;
@end


@interface JSWebViewController : UIViewController<UIWebViewDelegate,TestJSExport>

@property (strong, nonatomic)  UIWebView *mWebView;

@property (strong, nonatomic) JSContext *context;
@end

NS_ASSUME_NONNULL_END

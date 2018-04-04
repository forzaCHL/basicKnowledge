//
//  NSString+AES.h
//  EYEDCircle
//
//  Created by  on 2017/11/17.
//  Copyright © 2017年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import "GTMBase64.h"

@interface NSString (AES)
/**加密方法*/
-(NSString *)edc_encryptWithAESwithKey:(NSString *)key;
/**< 解密方法 */
- (NSString*)edc_decryptWithAESwithKey:(NSString *)key;
@end

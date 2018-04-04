//
//  NSString+AES.m
//  EYEDCircle
//
//  Created by on 2017/11/17.
//  Copyright © 2017年 . All rights reserved.
//

#import "NSString+AES.h"

//static NSString *const key = @"tobacco#4r!w@qow";
//static NSString *const key = @"tobacco#4r!w@qow";

@implementation NSString (AES)

-(NSString *)edc_encryptWithAESwithKey:(NSString *)key{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *AESData = [self AES128operation:kCCEncrypt
                                       data:data
                                        key:key
                                         iv:key];
    NSString *baseStr_GTM = [self encodeBase64Data:AESData];
    NSString *baseStr = [AESData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
//    EDCLog(@"*****************\nGTMBase:%@\n*****************", baseStr_GTM);
//    EDCLog(@"*****************\niOSCode:%@\n*****************", baseStr);
    return baseStr_GTM;
}
-(NSString *)edc_decryptWithAESwithKey:(NSString *)key{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *baseData_GTM = [self decodeBase64Data:data];
    NSData *baseData = [[NSData alloc]initWithBase64EncodedString:self options:0];
    
    NSData *AESData_GTM = [self AES128operation:kCCDecrypt
                                           data:baseData_GTM
                                            key:key
                                             iv:key];
    NSData *AESData = [self AES128operation:kCCDecrypt
                                       data:baseData
                                        key:key
                                         iv:key];
    
    NSString *decStr_GTM = [[NSString alloc] initWithData:AESData_GTM encoding:NSUTF8StringEncoding];
    NSString *decStr = [[NSString alloc] initWithData:AESData encoding:NSUTF8StringEncoding];
//
//    EDCLog(@"*****************\nGTMBase:%@\n*****************", decStr_GTM);
//    EDCLog(@"*****************\niOSCode:%@\n*****************", decStr);
    
    return decStr;
}
/**
 *  AES加解密算法
 *
 *  @param operation kCCEncrypt（加密）kCCDecrypt（解密）
 *  @param data      待操作Data数据
 *  @param key       key
 *  @param iv        向量
 *
 *
 */
- (NSData *)AES128operation:(CCOperation)operation data:(NSData *)data key:(NSString *)key iv:(NSString *)iv {
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // IV
    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    size_t bufferSize = [data length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptorStatus = CCCrypt(operation, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                            keyPtr, kCCKeySizeAES128,
                                            ivPtr,
                                            [data bytes], [data length],
                                            buffer, bufferSize,
                                            &numBytesEncrypted);
    
    if(cryptorStatus == kCCSuccess) {
        printf("Success");
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        
    } else {
        printf("Error");
    }
    
    free(buffer);
    return nil;
}

/**< GTMBase64编码 */
- (NSString*)encodeBase64Data:(NSData *)data {
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

/**< GTMBase64解码 */
- (NSData*)decodeBase64Data:(NSData *)data {
    data = [GTMBase64 decodeData:data];
    return data;
}

@end

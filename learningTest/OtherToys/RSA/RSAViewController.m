//
//  RSAViewController.m
//  learningTest
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "RSAViewController.h"
#import "NSString+AES.h"
#import "RSA.h"
@interface RSAViewController ()

@end

@implementation RSAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AES];
    [self RSA];
}
-(void)RSA{
        NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";
        NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";
    
    
    
    NSString *originString = @"hello world!";
    NSString *encWithPubKey;
    NSString *decWithPrivKey;
    encWithPubKey = [RSA encryptString:originString publicKey:pubkey];
    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
    NSLog(@"Original string(%d): %@", (int)originString.length, originString);
    NSLog(@"Enctypted with public key: %@", encWithPubKey);
    NSLog(@"Decrypted with private key: %@", decWithPrivKey);
}
-(void)AES{
//    对称加密    加密（encryption）与解密（decryption）使用的是同样的密钥（secret key） AES/DES
//    非对称加密  非对称加密算法需要两个密钥来进行加密和解密，这两个秘钥公钥私钥  RSA
    
    
    
    NSString *testString = @"hello world";
    NSString *codeStrings = [testString edc_encryptWithAESwithKey:@"gddjpt_publicaes"];
    NSString *codeStringsss = [codeStrings edc_decryptWithAESwithKey:@"gddjpt_publicaes"];
    NSLog(@"testString->%@..codeStrings->%@..codeStringsss->%@",testString,codeStrings,codeStringsss);
    
    
//    NSString *codeStr = @"dgJ+A61ouAhWMVZkv3m31J4xgj3Z/QJ+DFE90vz+1V8ZfhetJR8YmZc7TXvqC9/dJv+6kOmluU9OB+4c+ryLSOFfY9qarNgorQSZ69jPsPnyfjvBlSSEcJrmizqIU+HwdvECSJnSmLqcWnIPOOTL9g==";
//     NSString *codeStringssssss = [codeStr edc_decryptWithAESwithKey:@"gddjpt_publicaes"];
    
    
}

@end

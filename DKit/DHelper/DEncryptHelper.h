//
//  DEncryptHelper.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/13.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>//md5
#import <CommonCrypto/CommonCryptor.h>
@interface DEncryptHelper : NSObject
//md5
+ (NSString *)md5_16:(NSString *)str;
+ (NSString *)md5_32:(NSString *)str;
+ (NSString *)md5_16_DataHash:(NSData *)data;
+ (NSString *)md5_32_DataHash:(NSData *)data;
//DES
+ (NSData *) encryptUseDES:(NSString *)clearText key:(NSString *)key;
+ (NSString *) decryptUseDES:(NSData *)plainData key:(NSString *)key;

//AES
+ (NSData *) encryptUseAES:(NSData *)data key:(NSString *) key;
+ (NSData *) decryptUseAES:(NSData *)data key:(NSString *) key;

// SHA256
+ (NSData *) sha256:(NSData *)data;
@end

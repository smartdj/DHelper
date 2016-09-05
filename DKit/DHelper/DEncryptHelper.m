//
//  DEncryptHelper.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/13.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "DEncryptHelper.h"
#ifdef RSA
#include <string.h>
#include <openssl/rsa.h>
#include <openssl/applink.c>
#endif
@implementation DEncryptHelper
#ifdef RSA
void print_buf_hex( unsigned char *buf, int len )
{
    int i;
    
    for( i = 0; i < len; i++ )
    {
        printf( "%02x", buf[i] );
    }
}

int main( int argc, char *argv[] )
{
    RSA           *rsa;
    int            n;
    unsigned char  text[128], cipher[128];
    unsigned char  rsa_n[128], rsa_d[128];
    
    // 生成密钥
    rsa = RSA_generate_key( 1024, RSA_F4, NULL, NULL );
    if( NULL == rsa )
    {
        printf( "main.RSA_generate_key\n" );
        return -1;
    }
    n = RSA_size( rsa );
    BN_bn2bin( rsa->n, rsa_n ); // 保存公钥
    BN_bn2bin( rsa->d, rsa_d ); // 保存私钥
    RSA_free( rsa );
    printf( "RSA_size: %d\n\npublic modulus:\n", n );
    print_buf_hex( rsa_n, sizeof(rsa_n) );
    printf( "\n\nprivate exponent:\n" );
    print_buf_hex( rsa_d, sizeof(rsa_d) );
    printf( "\n\n" );
    
    // 加密的过程
    rsa = RSA_new();
    if( NULL == rsa )
    {
        printf( "main.RSA_new for encrypt\n" );
        return -1;
    }
    // 设置公钥
    rsa->n = BN_bin2bn( rsa_n, sizeof(rsa_n), rsa->n );
    rsa->e = BN_bin2bn( "\x01\x00\x01", 3, rsa->e );
    // 设置明文并加密
    for( n = 0; n < sizeof(text); n++ )
    {
        text[n] = n;
    }
    n = RSA_public_encrypt( sizeof(text), text, cipher, rsa, RSA_NO_PADDING );
    RSA_free( rsa );
    printf( "RSA_public_encrypt: %d\ncipher:\n", n );
    print_buf_hex( cipher, sizeof(cipher) );
    printf( "\n\n" );
    
    // 解密的过程
    rsa = RSA_new();
    if( NULL == rsa )
    {
        printf( "main.RSA_new for decrypt\n" );
        return -1;
    }
    // 设置公钥及私钥
    rsa->n = BN_bin2bn( rsa_n, sizeof(rsa_n), rsa->n );
    rsa->e = BN_bin2bn( "\x01\x00\x01", 3, rsa->e );
    rsa->d = BN_bin2bn( rsa_d, sizeof(rsa_d), rsa->d );
    // 解密数据
    n = RSA_private_decrypt( sizeof(cipher), cipher, text, rsa,
                            RSA_NO_PADDING );
    RSA_free( rsa );
    printf( "RSA_private_decrypt: %d\ntext:\n", n );
    print_buf_hex( text, sizeof(text) );
    putchar( '\n' );
    
    return 0;
}
#endif
#pragma mark md5 32位 加密 （小写）
+ (NSString *)md5_32:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );

    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],
            result[4],result[5],result[6],result[7],
            result[8],result[9],result[10],result[11],
            result[12],result[13],result[14],result[15],
            result[16], result[17],result[18], result[19],
            result[20], result[21],result[22], result[23],
            result[24], result[25],result[26], result[27],
            result[28], result[29],result[30], result[31]];
}

+ (NSString *)md5_32_DataHash:(NSData *)data
{
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(data.bytes, (CC_LONG)data.length, md5Buffer);
    
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

#pragma mark md5 16位加密 （小写）
+(NSString *)md5_16_DataHash:(NSData *)data
{
    const char *cStr = (const char *)[data bytes];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+(NSString *)md5_16:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}



#pragma mark md5 16位加密 （大写）
////md5 16位加密 （大写）
//-(NSString *)md5:(NSString *)str
//{
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5( cStr, strlen(cStr), result );
//    
//    return [NSString stringWithFormat:
//            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ];
//}

#pragma mark - DES
+(NSData *) encryptUseDES:(NSString *)clearText key:(NSString *)key
{
    NSData *cipherData = nil;
    NSData *textData = [clearText dataUsingEncoding:NSUTF8StringEncoding]; //NSUTF8StringEncoding, NSASCIIStringEncoding
    NSUInteger dataLength = [clearText length];
    
    //如果待加密的明文中含有汉字的话，dataLength长度要增加（因为能用ASCII码表示的字符占一个字节，而汉字占3个字节）
    int hangCount = 0;//计数clearText中汉字的数量
    for (int i=0; i<dataLength; ++i)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [clearText substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) //汉字占用三个3个字节
        {
            hangCount++;
        }
    }
    
    dataLength = dataLength + hangCount*2;
    
    
    unsigned char buffer[2048];
    //    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES, //kCCEncrypt,kCCDecrypt
                                          kCCOptionPKCS7Padding,  //kCCOptionECBMode,kCCOptionPKCS7Padding
                                          [key UTF8String], kCCKeySizeDES,  //,kCCKeySizeDES, kCCKeySizeMinRC2
                                          NULL,  //iv
                                          [textData bytes]  , dataLength,
                                          buffer, 2048,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //NSLog(@"DES加密成功");
        cipherData = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
    }else{
        //NSLog(@"DES加密失败");
    }
    return cipherData;
}

+(NSString *) decryptUseDES:(NSData *)plainData key:(NSString *)key
{
    
    NSString *cleartext = nil;
    NSUInteger dataLength = [plainData length];
    //    unsigned char buffer[1024];
    unsigned char buffer[2048];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          NULL,  //iv
                                          [plainData bytes]  , dataLength,
                                          buffer, 2048,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //NSLog(@"DES解密成功");
        
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        cleartext = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
    }else{
        //NSLog(@"DES解密失败");
    }
    return cleartext;
}
#pragma mark -

#pragma mark - AES
+ (NSData*) encryptUseAES:(NSData *)data key:(NSString *) key
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero( keyPtr, sizeof(keyPtr) );
    
    [key getCString: keyPtr maxLength: sizeof(keyPtr) encoding: NSUTF16StringEncoding];
    size_t numBytesEncrypted = 0;
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    CCCryptorStatus result = CCCrypt( kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                     keyPtr, kCCKeySizeAES256,
                                     NULL,
                                     [data bytes], [data length],
                                     buffer, bufferSize,
                                     &numBytesEncrypted );
    
    if( result == kCCSuccess )
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    
    return nil;
}

+ (NSData *) decryptUseAES:(NSData *)data key:(NSString *) key
{
    char  keyPtr[kCCKeySizeAES256+1];
    bzero( keyPtr, sizeof(keyPtr) );
    
    [key getCString: keyPtr maxLength: sizeof(keyPtr) encoding: NSUTF16StringEncoding];
    
    size_t numBytesEncrypted = 0;
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer_decrypt = malloc(bufferSize);
    
    CCCryptorStatus result = CCCrypt( kCCDecrypt , kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                     keyPtr, kCCKeySizeAES256,
                                     NULL,
                                     [data bytes], [data length],
                                     buffer_decrypt, bufferSize,
                                     &numBytesEncrypted );
    
    if( result == kCCSuccess )
        return [NSData dataWithBytesNoCopy:buffer_decrypt length:numBytesEncrypted];
    
    return nil;
}
#pragma mark -
@end

//
//  NSData+NSString.m
//  QiyuExplorer
//
//  Created by DJ on 16/2/1.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "NSData+NSString.h"

@implementation NSData (NSString)
- (NSString*) stringFromData
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString*) stringFromGB2312Data
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *text = [[NSString alloc] initWithData:self encoding:encoding];
    return text;
}

- (NSString *)hexString {
    /* Returns hexadecimal string of NSData. Empty string if data is empty.   */
    
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    
    if (!dataBuffer)
        return [NSString string];
    
    NSUInteger          dataLength  = [self length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    
    return [NSString stringWithString:hexString];
}
@end

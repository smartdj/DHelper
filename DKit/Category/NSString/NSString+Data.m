//
//  NSString+Data.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/5.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "NSString+Data.h"

@implementation NSString (Data)
-(NSData*) dataFromString
{
    return  [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)dataFromHexString{
    NSString *tmp = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableData *data= [[NSMutableData alloc] init];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [tmp length]/2; i++) {
        byte_chars[0] = [tmp characterAtIndex:i*2];
        byte_chars[1] = [tmp characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    return data;
}
@end

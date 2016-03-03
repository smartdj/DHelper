//
//  NSData+NSString.m
//  QiyuExplorer
//
//  Created by DJ on 16/2/1.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "NSData+NSString.h"

@implementation NSData (NSString)
-(NSString*) stringFromData
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

-(NSString*) stringFromGB2312Data
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *text = [[NSString alloc] initWithData:self encoding:encoding];
    return text;
}
@end

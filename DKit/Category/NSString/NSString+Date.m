//
//  NSString+Date.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/21.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)
-(NSDate*) toDateWithFormat:(NSString*)format
{
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] ;
    //设置格式：zzz表示时区@"yyyy-MM-dd HH:mm:ss zzz"
    [formatter setDateFormat:format];
    [formatter setLocale:usLocale];
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:self];
    return date;
}
@end

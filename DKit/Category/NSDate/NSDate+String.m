//
//  NSDate+String.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/21.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)
-(NSString*)toStringWithFormat:(NSString*)format
{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区@"yyyy-MM-dd HH:mm:ss zzz"
    [dateFormatter setDateFormat:format];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:self];
    return currentDateString;
}

-(NSString *)timeStamp
{
    NSDate *datenow = [NSDate date];//现在时间
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];//微秒级
    return timeSp;
}
@end

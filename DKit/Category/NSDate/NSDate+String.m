//
//  NSDate+String.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/21.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)
- (NSString*)toStringWithFormat:(NSString*)format
{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区@"yyyy-MM-dd HH:mm:ss zzz"
    [dateFormatter setDateFormat:format];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:self];
    return currentDateString;
}

+ (NSString *)timeStamp
{
    NSDate *datenow = [NSDate date];//现在时间
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];//微秒级
    return timeSp;
}

- (NSString *)day
{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:self];
    return currentDateString;
}

- (NSInteger)weekdayIndex
{
//    NSLog(@"%@", [[NSDate date] toStringWithFormat:@"yyyy-MM-dd HH:mm:ss zzz"]);
//    NSLog(@"%@", [self toStringWithFormat:@"yyyy-MM-dd HH:mm:ss zzz"]);
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *dateComps = [calendar components:NSCalendarUnitWeekday fromDate:self];
    
    NSInteger weekDay = dateComps.weekday;
    
    return weekDay;
}

- (NSString*)weekdayString
{
    NSInteger weekDay = [self weekdayIndex];
    
    switch (weekDay) {
        case 1:
            return @"星期日";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            return @"";
            break;
    }
}
@end

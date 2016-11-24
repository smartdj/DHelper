//
//  NSTimeZone+Utils.m
//  Duwa
//
//  Created by Arthur on 2016/11/24.
//  Copyright © 2016年 miduotek. All rights reserved.
//

#import "NSTimeZone+Utils.h"

@implementation NSTimeZone (Utils)

+ (NSTimeZone *)eastEightTimeZone{
    return [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
}
@end

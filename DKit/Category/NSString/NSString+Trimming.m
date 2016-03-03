//
//  NSString+Trimming.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/1.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSString+Trimming.h"

@implementation NSString (Trimming)

//移除开头的字符
-(NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet
{
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (; location < length; location++)
    {
        if (![characterSet characterIsMember:charBuffer[location]])
        {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

//移除结尾的字符
- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet
{
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (; length > 0; length--)
    {
        if (![characterSet characterIsMember:charBuffer[length - 1]])
        {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

//移除所有的字符
-(NSString*)trim:(NSString*)str
{
    if(str && self)
    {
        return [self stringByReplacingOccurrencesOfString:str withString:@""];
    }
    return nil;
}

- (NSString *)stringByTrimmingTrailingWhitespaceAndNewline {
    return [self stringByTrimmingTrailingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end

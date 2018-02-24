//
//  NSString+Regex.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/14.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)
-(BOOL)isMatchWithRegex:(NSString*)regexStr
{
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSTextCheckingResult *result = [regex firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    return result != nil ? YES : NO;
}

-(NSString*) subStringWithRegex:(NSString*)regexStr
{
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSTextCheckingResult *result = [regex firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    if(result)
    {
        return [NSString stringWithString:[self substringWithRange:result.range]];
    }
    return nil;
}

- (NSArray<NSString *> *)regexCapture:(NSString*)pattern{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    //match: 所有匹配到的字符,根据() 包含级
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in matches) {
        for (int i = 0; i < [match numberOfRanges]; i++) {
            //以正则中的(),划分成不同的匹配部分
            NSString *component = [self substringWithRange:[match rangeAtIndex:i]];  
            [array addObject:component];
        }
    }
    return array;
}
@end

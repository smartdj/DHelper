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
@end

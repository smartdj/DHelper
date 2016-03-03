//
//  DURLHelper.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/14.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "DURLHelper.h"
#import "NSString+Regex.h"
#import "NSString+Trimming.h"

@implementation DURLHelper
+(BOOL) isValidateUrl:(NSString*)url
{
    if(!url)
    {
        return NO;
    }
    
    if([url isMatchWithRegex:@"^(https?|ftp)://"])
    {
        return [url isMatchWithRegex:@"^((https?|ftp)://|(www|ftp)\\.)[a-z0-9-]+(\\.[a-z0-9-]+)+(:[0-9]+)?([/?].*)?$"];
    }
    
    if([url isMatchWithRegex:@"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])([/?].*)?$"])
    {
        return YES;
    }
    
    if([self isIPAddress:url])
    {
        return [url isMatchWithRegex:@"^((www|ftp)\\.)?[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]+)(:[0-9]+)?([/?].*)?$"];
    }
    
    return NO;
}

+(BOOL)isIPAddress:(NSString*)ipAddress
{
    NSRange range = [ipAddress rangeOfString:@"/"];
    
    if(range.location != NSNotFound)
    {
        ipAddress = [ipAddress substringToIndex:range.location];
    }
    
    NSArray<NSString*>* ipArray = [ipAddress componentsSeparatedByCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    
    if(ipArray)
    {
        for (NSString* str in ipArray)
        {
            NSInteger number = [str integerValue];
            if(number >= 0 && number <= 255)
            {
                return NO;
            }
        }
        return YES;
    }
    return NO;
}

+(BOOL) isUrlProtocal:(NSString*)url
{
    url = [url lowercaseString];
    
    if([url hasPrefix:@"http://"] || [url hasPrefix:@"https://"])
    {
        return YES;
    }
    return NO;
}

+(NSString*) fixUrl:(NSString*)url
{
    url = [url lowercaseString];
    if(![url hasPrefix:@"http://"] && ![url hasPrefix:@"https://"])
    {
        if(![url hasPrefix:@"www."] && [url rangeOfCharacterFromSet:
                                         [NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)
        {
            NSArray<NSString*>* array = [url componentsSeparatedByString:@"/"];
            if(array && array.count > 0)
            {
                NSArray<NSString*>* array2 = [array[0] componentsSeparatedByCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
                
                if(array2)
                {
                    NSInteger num = array.count -1;
                    if(num == 1)
                        url  =  [NSString stringWithFormat:@"www.%@", url];
                }
            }
        }
        url = [NSString stringWithFormat:@"http://%@", [url stringByTrimmingTrailingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]]];
    }
    return url;
}

//+(BOOL)validateUrl:(NSString *)candidate
//{
//    /*NSString *urlRegEx =
//     @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
//     NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
//     return [urlTest evaluateWithObject:candidate];*/
//    
//    NSURL *tmpURL = [NSURL URLWithString:candidate];
//    if ([tmpURL host] != nil && ![[tmpURL host] isEqualToString:@""] && [[tmpURL host] rangeOfString:@"."] .location != NSNotFound)
//    {
//        NSString *urlRegEx =
//        @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
//        NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
//        return [urlTest evaluateWithObject:[NSString stringWithFormat:@"%@://%@",[tmpURL scheme],[tmpURL host]]];
//    }else
//    {
//        return NO;
//    }
//}

@end

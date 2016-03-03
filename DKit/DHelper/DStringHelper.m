//
//  DJStrings.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/30.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "DStringHelper.h"

@implementation DStringHelper

+(NSString*)removeLastCharacter:(NSMutableString*)str
{
    NSRange r1 = NSRangeFromString(str);
    r1.location = str.length - 1;
    r1.length = 1;
    [str deleteCharactersInRange:r1];
    return str;
}

+(NSString*)remove:(NSMutableString*)string prefix:(NSString*)prefix
{
    if([string hasPrefix:prefix])
    {
        NSRange range;
        range.length = prefix.length;
        range.location = 0;
        [string deleteCharactersInRange:range];
        return string;
    }
    return  nil;
}
@end

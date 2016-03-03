//
//  NSString+WCarToString.m
//  QiyuExplorer
//
//  Created by DJ on 15/11/30.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSString+WChar.h"
#include <wchar.h>

@implementation NSString (WChar)
+ (NSString*) StringFromWChar:(const wchar_t*) inStr
{
    char* str = new char[wcslen( inStr )+1];
    wcstombs(str, inStr, wcslen( inStr )+1 );
    NSString* wNSString = [NSString stringWithCString:str encoding:NSUTF8StringEncoding];
    delete [] str;
    return wNSString;
}

-(wchar_t*)toWChar
{
    const char *cString = [self cStringUsingEncoding:NSUTF8StringEncoding];
    setlocale(LC_CTYPE, "UTF-8");
    wchar_t *outStr = NULL;
    size_t size = mbstowcs(NULL, cString, 0);
    outStr = new wchar_t[size + 1];
    if (outStr) {
        memset(outStr, 0, size * sizeof(wchar_t));
        size_t ret = mbstowcs(outStr, cString, size+1);
        if (ret == -1) {
            delete[] outStr;
            outStr = NULL;
        }
    }
    return outStr;
}
@end

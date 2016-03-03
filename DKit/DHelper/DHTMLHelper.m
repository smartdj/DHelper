//
//  DHTMLHelper.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/18.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "DHTMLHelper.h"

@implementation DHTMLHelper

static int encodingPriority[] = {
    NSUTF8StringEncoding,
    NSASCIIStringEncoding,
    NSISOLatin1StringEncoding,
    NSISOLatin2StringEncoding,
    NSUnicodeStringEncoding,
    NSWindowsCP1251StringEncoding,
    NSWindowsCP1252StringEncoding,
    NSWindowsCP1253StringEncoding,
    NSWindowsCP1254StringEncoding,
    NSWindowsCP1250StringEncoding,
    NSNEXTSTEPStringEncoding,
    NSJapaneseEUCStringEncoding,
    NSNonLossyASCIIStringEncoding,
    NSShiftJISStringEncoding,          /* kCFStringEncodingDOSJapanese */
    NSISO2022JPStringEncoding,        /* ISO 2022 Japanese encoding for e-mail */
    NSMacOSRomanStringEncoding,
    NSUTF16BigEndianStringEncoding,
    NSUTF16LittleEndianStringEncoding,
    NSUTF32StringEncoding,
    NSUTF32BigEndianStringEncoding,
    NSUTF32LittleEndianStringEncoding
};

#define REQUIRED_HTML_STRING    @"<html"

//检测html的编码
+ (NSString *)htmlStringForUnknownEncodingData:(NSData *)data detectedEncoding:(NSStringEncoding *)detectedEncoding
{
    NSStringEncoding encoding;
    NSString *html;
    
    for (int i = 0; i < sizeof(encodingPriority); i++)
    {
        encoding = encodingPriority[i];
        
        // try this encoding
        html = [[NSString alloc] initWithData:data encoding:encoding];
        
        // we need to find a text, because bad encoding will return an unreadable text
        if (html && [html rangeOfString:REQUIRED_HTML_STRING options:NSCaseInsensitiveSearch].location != NSNotFound) {
            *detectedEncoding = encoding;
            return html;
        }
    }
    return nil;
}
@end

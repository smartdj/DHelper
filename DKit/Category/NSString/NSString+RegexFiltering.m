//
//  NSString+RegexFiltering.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/17.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "NSString+RegexFiltering.h"
#import "RegexKitLite.h"
#import "LGHelper.h"
@implementation NSString (RegexFiltering)
- (BOOL)_isMatchedByAnyRegexInArray:(NSArray *)regexArray
{
    if (!regexArray)
        return NO;
    
    for (NSString *regex in regexArray)
    {
        @try
        {
            NSError* error = nil;
            if ([self isMatchedByRegex:regex options:RKLCaseless inRange:NSMakeRange(0, [self length]) error:&error])
                return YES;
            
            if(error)
                DLog(@"%@",error);
        }
        @catch (NSException *exception)
        {
            NSLog(@"%@", [exception description]);
        }
        @finally {
            
        }
    }
    return NO;
}

- (NSString *)stringByReplacingOccurrencesOfRegex:(NSString *)regex replace:(NSInteger)capture withString:(NSString *)reference {
    __block int count = 0;
    
    return [self stringByReplacingOccurrencesOfRegex:regex usingBlock:^NSString *(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        if (count < capture) {
            count++;
            return reference;
        }
        count++;
        return capturedStrings[0];
    }];
}

- (NSDictionary *)parseAsFilter
{
    NSMutableDictionary *filter = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithBool:NO],@"IsWhitelist",
                                   nil,@"RegularExpression",
                                   nil];
    
    NSString *current = [NSString stringWithString:self];
    NSString *filterEditorString = current;
    
    if ([current length] == 0)
        return nil;
    
    // For now, we ignore special-adblock-filters
    //current = [current stringByMatching:@"\\$(~?[\\w\\-]+(?:,~?[\\w\\-]+)*)$"
    //							replace:1
    //				withReferenceString:@""];
    
    if ([self isMatchedByRegex:@"#"])
        return nil;
    if ([self isMatchedByRegex:@"\\$"])
        return nil;
    
    // Comment?
    if ([current length] >= 1 && [current characterAtIndex:0] == '!')
        return nil;
    
    // Whitelist?
    if ([current length] >= 2 && [current characterAtIndex:0] == '@' && [current characterAtIndex:1] == '@')
    {
        current = [current substringFromIndex:2];
        filterEditorString = current;
       
        if ([current isMatchedByRegex:@"^\\|?https?://"])
        {
            [filter setObject:[NSNumber numberWithBool:YES] forKey:@"IsPageWhitelist"];
            filterEditorString = [filterEditorString stringByMatching:@"^\\|?https?://" replaceWithEmptyString:1];
        }
        else
        {
            [filter setObject:[NSNumber numberWithBool:YES] forKey:@"IsWhitelist"];
            filterEditorString = current;
        }
    }
    
    // Regular expression?
    if ([current length] >= 2 && [current characterAtIndex:0] == '/' && [current characterAtIndex:[current length]-1] == '/')
    {
        [filter setObject:[NSNumber numberWithBool:YES] forKey:@"IsAlreadyRegularExpression"];
        current = [current substringWithRange:NSMakeRange(1, [current length]-2)];
        filterEditorString = current;
        
    }
    else
    {
        NSString *anchorParsed;
        
        // Next few lines inspired by AdBlock Plus
        // http://adblockplus.org
        // Prefs.js, line 924 of CVS version 1.64 (Mon Sep 24 09:22:37 2007)
        
        // Escape special symbols
        current = [current stringByReplacingOccurrencesOfRegex:@"(\\W)" withString:@"\\\\$1"];
        
        // Replace "\*" by ".*"
        current = [current stringByReplacingOccurrencesOfRegex:@"(\\\\\\*)" withString:@".*"];
        
        // Anchor at beginning
        anchorParsed = [current stringByReplacingOccurrencesOfRegex:@"(^\\\\\\|)" replace:1 withString:@"^"];
       
        if (![current isEqualToString:anchorParsed])
        {
            [filter setObject:[NSNumber numberWithBool:YES] forKey:@"HasBeginningAnchor"];
            current = anchorParsed;
            filterEditorString = [filterEditorString stringByReplacingOccurrencesOfRegex:@"(^\\|)" replace:1 withString:@""];
        }
        
        // Anchor at end
        anchorParsed = [current stringByReplacingOccurrencesOfRegex:@"(\\\\\\|$)" replace:1 withString:@"$$"];
       
        if (![current isEqualToString:anchorParsed])
        {
            [filter setObject:[NSNumber numberWithBool:YES] forKey:@"HasEndAnchor"];
            current = anchorParsed;
            filterEditorString = [filterEditorString stringByReplacingOccurrencesOfRegex:@"(\\|$)" replace:1 withString:@""];
            
        }
    }
    
    [filter setObject:current forKey:@"RegularExpression"];
    [filter setObject:filterEditorString forKey:@"FilterEditorString"];
    return filter;
}

// FIXME: RegexKit bug?
- (NSString *)stringByMatching:(id)aRegex replaceWithEmptyString:(const NSUInteger)count
{
    NSMutableString *temp = [NSMutableString stringWithString:[self stringByReplacingOccurrencesOfRegex:(NSString *)aRegex replace:count withString:@"FIX_THIS_BUG"]];
    [temp replaceOccurrencesOfString:@"FIX_THIS_BUG" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [temp length])];
    return temp;
}
@end

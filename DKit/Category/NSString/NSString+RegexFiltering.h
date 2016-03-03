//
//  NSString+RegexFiltering.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/17.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegexFiltering)
- (BOOL)_isMatchedByAnyRegexInArray:(NSArray *)regexArray;
- (NSString *)stringByReplacingOccurrencesOfRegex:(NSString *)regex replace:(NSInteger)capture withString:(NSString *)reference;
- (NSDictionary *)parseAsFilter;
- (NSString *)stringByMatching:(id)aRegex replaceWithEmptyString:(const NSUInteger)count;
@end

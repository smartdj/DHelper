//
//  NSString+Regex.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/14.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)
-(BOOL)isMatchWithRegex:(NSString*)regexStr;
-(NSString*) subStringWithRegex:(NSString *)regexStr;
-(NSArray<NSString *> *)regexCapture:(NSString *)pattern;
@end

//
//  NSString+Trimming.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/1.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trimming)
- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet;
-(NSString*)trim:(NSString*)str;
@end

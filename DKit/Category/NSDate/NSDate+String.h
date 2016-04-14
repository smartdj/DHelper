//
//  NSDate+String.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/21.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (String)
- (NSString*)toStringWithFormat:(NSString*)format;
+ (NSString *)timeStamp;
- (NSString *)day;
- (NSString*)weekdayString;
- (NSInteger)weekdayIndex;
@end

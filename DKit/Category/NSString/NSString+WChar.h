//
//  NSString+WCarToString.h
//  QiyuExplorer
//
//  Created by DJ on 15/11/30.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WChar)
+(NSString*) StringFromWChar:(const wchar_t*) inStr;
-(wchar_t*)toWChar;
@end

//
//  NSString+Encode.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/8.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encode)
- (NSString *) fromUTF8ToUnicode;
- (NSString *) fromUnicodeToUTF8;
- (NSString *) encodeToPercentEscapeString;
- (NSString *) decodeFromPercentEscapeString;
@end

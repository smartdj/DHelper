//
//  NSString+URL.h
//  pangxie
//
//  Created by arthur on 2017/5/13.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString;
@end

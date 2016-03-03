//
//  DHTMLHelper.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/18.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHTMLHelper : NSObject
//检测html的编码
+ (NSString *)htmlStringForUnknownEncodingData:(NSData *)data detectedEncoding:(NSStringEncoding *)detectedEncoding;
@end

//
//  NSHTTPURLResponse+MPAdditions.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/18.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPURLResponse (MPAdditions)
- (NSStringEncoding)stringEncodingFromContentType:(NSString *)contentType;
@end

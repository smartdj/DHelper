//
//  DURLHelper.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/14.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DURLHelper : NSObject
+(NSString*) fixUrl:(NSString*)url;
+(BOOL) isUrlProtocal:(NSString*)url;
+(BOOL) isIPAddress:(NSString*)ipAddress;
+(BOOL) isValidateUrl:(NSString*)url;
@end

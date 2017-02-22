//
//  DAppStoreHelper.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/25.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAppStoreHelper : NSObject
+(void)gotoAppStore:(NSString*)appID;

+ (void)openExternalURL:(NSString *)URLString;
@end

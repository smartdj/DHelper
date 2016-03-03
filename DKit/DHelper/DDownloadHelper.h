//
//  DDownloadCenter.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/7.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonBase.h"
@interface DDownloadHelper : SingletonBase
-(void)addDownloadTaskWithUrl:(NSString*)url succeed:(void(^)(NSData* responseData))succeedBlock failure:(void(^)(NSError *error))failureBlock;
@end

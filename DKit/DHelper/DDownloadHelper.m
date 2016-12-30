//
//  DDownloadCenter.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/7.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "DDownloadHelper.h"
#import "AFNetworking.h"
#import "LGHelper.h"
@implementation DDownloadHelper

- (AFURLSessionManager *)session
{
    static AFURLSessionManager *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        [configuration setHTTPMaximumConnectionsPerHost:1];//把同时进行的任务数限制为1，也就是串行下载
        
        session = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        session.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return session;
}

-(void)addDownloadTaskWithUrl:(NSString*)url succeed:(void(^)(NSData* responseData))succeed failure:(void(^)(NSError *error))failure;
{
    AFURLSessionManager *session = [self session];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]
                                            completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
                                  {
                                      if(error)
                                      {
                                          if(failure)
                                              failure(error);
                                          DLog(@"%@",error);
                                      }
                                      else
                                      {
                                          succeed(responseObject);
                                      }
                                  }];
    
    [task resume];
}
@end

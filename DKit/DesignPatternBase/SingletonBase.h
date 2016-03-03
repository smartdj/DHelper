//
//  SingletonBase.h
//  DesignPattern
//
//  Created by dj on 15/12/5.
//  Copyright © 2015年 dj. All rights reserved.
//
//  多线程安全，可继承的单例类
#import <Foundation/Foundation.h>

@interface SingletonBase : NSObject
+(instancetype) sharedInstance;
+ (void)destroyInstance;
@property (assign, readonly) BOOL isInitialized;
@end

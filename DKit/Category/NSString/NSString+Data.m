//
//  NSString+Data.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/5.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "NSString+Data.h"

@implementation NSString (Data)
-(NSData*) dataFromString
{
    return  [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end

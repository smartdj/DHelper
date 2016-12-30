//
//  DUtilsHelper.m
//  QiyuExplorer
//
//  Created by DJ on 16/2/3.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "DUtilsHelper.h"

@implementation DUtilsHelper
+ (void)makePhoneCall:(NSString *)phoneNumber wihtoutPrompt:(BOOL)withoutPrompt{
    //无提示直接拨打电话
    if(withoutPrompt){
        phoneNumber = [@"tel://" stringByAppendingString:phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }else{
        //有提示拨打电话
        phoneNumber = [@"telprompt://" stringByAppendingString:phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
}

@end

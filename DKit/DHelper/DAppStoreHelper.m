//
//  DAppStoreHelper.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/25.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "DAppStoreHelper.h"
#import "LGHelper.h"
@implementation DAppStoreHelper
//959447103
+(void)gotoAppStore:(NSString*)appID
{
    if(kDeviceIsPhone)
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", appID]]];
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", appID]]];
}
@end

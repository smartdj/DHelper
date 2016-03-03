//
//  UIView+Rotation.m
//  QiyuExplorer
//
//  Created by DJ on 16/1/22.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "UIView+Rotation.h"

@implementation UIView (Rotation)
-(void)addDeviceOrientationDidChangeNotificationHandler:(SEL)selector
{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:selector
     name:@"UIDeviceOrientationDidChangeNotification"
     object:nil];
}

-(void)removeDeviceOrientationDidChangeNotificationHandler:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}
@end

//
//  UIView+Rotation.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/22.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rotation)
//UIView监听屏幕旋转消息
-(void)addDeviceOrientationDidChangeNotificationHandler:(SEL)selector;
-(void)removeDeviceOrientationDidChangeNotificationHandler:(SEL)selector;
@end

//
//  UIWebView+screenshot.h
//  QiyuExplorer
//
//  Created by DJ on 15/11/27.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (ScreenShot)

//如果screenShotHeight赋值为小于等于0的值则会默认截取全部网页
- (UIImage *)screenShotWithHeigh:(CGFloat)screenShotHeight;

- (NSData *)PDFData;

@end

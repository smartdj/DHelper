//
//  _UIWebViewScrollView+Swizzling.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/9.
//  Copyright © 2015年 ruanmei. All rights reserved.
//
//这个分类是为了hook UIWebView中的_UIWebViewScrollView而设计
#import <Foundation/Foundation.h>


@interface UIScrollView(_UIWebViewScrollView_Swizzling)
@property BOOL enableChangeFrame;
-(void)hookSetFrame;
-(void) setFrameSwizzling:(CGRect) frame;
@end

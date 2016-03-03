//
//  UIView+ThumbnailImage.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/7.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView(ScreenShot)
-(UIImage*)getThumbnailImage:(CGRect)rect;
//以前起名不好，为了兼容以前的代码，创建了下面两个函数
-(UIImage*)screenShotWithSize:(CGSize)size;
-(UIImage*)screenShotWithRect:(CGRect)rect;
@end

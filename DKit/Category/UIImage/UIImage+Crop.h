//
//  UIImage+Corp.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/9.
//  Copyright © 2015年 ruanmei. All rights reserved.
//  图像截取

#import <UIKit/UIKit.h>

@interface UIImage (Crosp)
- (UIImage*)imageCropWithRect:(CGRect)targetRect;
@end

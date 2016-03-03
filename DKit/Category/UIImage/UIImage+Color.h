//
//  UIImage+Extension.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/29.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Color)
+ (UIImage *) imageWithColor: (UIColor *) color;
+ (UIImage *) imageWithColor: (UIColor *) color withSize:(CGSize)imageSize;
@end

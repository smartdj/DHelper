//
//  UIView+ThumbnailImage.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/7.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIView+ScreenShot.h"
#import "UIImage+Color.h"
#import "UIImage+Crop.h"

@implementation UIView(ScreenShot)
/**
 *  获取当前页面缩略图
 *
 *  @param rect 需要获取的范围，如果为CGRectNull，则获取完整的View截图
 *
 *  @return 截图
 */
-(UIImage*)getThumbnailImage:(CGRect)rect
{
    if(CGRectIsNull(rect) ||
       CGRectEqualToRect(rect, CGRectZero))
    {
        rect = self.bounds;
    }
    
    return [self screenShotWithSize:rect.size];
}

/**
 *  获取当前页面缩略图
 *
 *  @param rect 需要获取的范围，如果为CGRectNull，则获取完整的View截图
 *
 *  @return 截图
 */
-(UIImage*)screenShotWithRect:(CGRect)rect
{
    if(CGRectIsNull(rect) ||
       CGRectEqualToRect(rect, CGRectZero))
    {
        rect = self.bounds;
    }
    
    UIImage *image = [self screenShotWithSize:CGSizeZero];

    if(CGRectEqualToRect(self.bounds, rect) == NO)
        image = [image imageCropWithRect:rect];
    
    return image;
}

/**
 *  获取当前页面缩略图
 *
 *  @param size 需要获取的范围，如果为CGSizeZero，则获取完整的View截图
 *
 *  @return 截图
 */
-(UIImage*)screenShotWithSize:(CGSize)size
{
    if(CGSizeEqualToSize(size, CGSizeZero))
    {
        size = self.bounds.size;
    }
    else if (size.height > self.bounds.size.height)
    {
        //DLog(@"%f",self.bounds.size.height);
        size.height = self.bounds.size.height;
    }
    
    if(size.height == 0 || size.width == 0)
    {
        return [UIImage imageWithColor:[UIColor whiteColor]];
    }
    
    //支持retina高分的关键
    if(&UIGraphicsBeginImageContextWithOptions != NULL)
    {
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    }
    else
    {
        UIGraphicsBeginImageContext(size);
    }
    
    //如果被截图的窗口处于不可见状态则无法绘制，所以要先把他显示出来
    BOOL isHidden = self.hidden;
    if(isHidden)
        self.hidden = NO;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(isHidden)
        self.hidden = YES;
    
    return image;
}
@end

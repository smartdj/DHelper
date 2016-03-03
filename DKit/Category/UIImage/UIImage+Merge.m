//
//  UIImage+Merge.m
//  QiyuExplorer
//
//  Created by DJ on 16/2/4.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import "UIImage+Merge.h"

@implementation UIImage (Merge)


+(UIImage *)mergeImage:(UIImage *)image1 withImage:(UIImage *)image2 mergeType:(ImageMergeType) mergeType imageSpacing:(CGFloat)imageSpcing
{
    if(mergeType == ImageMergeType_Abreast)
    {
        CGSize size = CGSizeMake(image1.size.width + imageSpcing + image2.size.width, image1.size.height>=image2.size.height?image1.size.height:image2.size.height);
        
        //支持retina高分的关键
        if(&UIGraphicsBeginImageContextWithOptions != NULL)
        {
            UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
        }
        else
        {
            UIGraphicsBeginImageContext(size);
        }
        [image1 drawInRect:CGRectMake(0, 0, image1.size.width, size.height)];
        [image2 drawInRect:CGRectMake(image1.size.width + imageSpcing, 0, image2.size.width, size.height)];
        UIImage *togetherImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return togetherImage;
    }
    return nil;
}
@end

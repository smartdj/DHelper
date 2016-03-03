//
//  UIImage+Merge.h
//  QiyuExplorer
//
//  Created by DJ on 16/2/4.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ImageMergeType_Abreast = 0//并排
}ImageMergeType;

@interface UIImage (Merge)
+(UIImage *)mergeImage:(UIImage *)image1 withImage:(UIImage *)image2 mergeType:(ImageMergeType) mergeType imageSpacing:(CGFloat)imageSpcing;
@end

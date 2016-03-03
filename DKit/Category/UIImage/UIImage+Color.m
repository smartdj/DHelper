//
//  UIImage+Extension.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/29.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage(Color)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(UIImage *) imageWithColor: (UIColor *) color
{
    return [self imageWithColor:color withSize:CGSizeMake(1.f, 1.f)];
}

+ (UIImage *) imageWithColor: (UIColor *) color withSize:(CGSize)imageSize
{
    CGRect rect=CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end

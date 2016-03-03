//
//  UIColor+Extension.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/26.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor(Category)
+(UIColor*)colorFromRBG:(NSInteger)hex
{
   return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 \
                    green:((float)((hex & 0x00FF00) >>  8))/255.0 \
                     blue:((float)((hex & 0x0000FF) >>  0))/255.0 \
                          alpha:1.0];
}

+(UIColor*)colorFromRBG:(NSInteger)hex withAlpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 \
                           green:((float)((hex & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((hex & 0x0000FF) >>  0))/255.0 \
                           alpha:alphaValue];
}
@end

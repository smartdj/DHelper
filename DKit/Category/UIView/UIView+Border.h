//
//  UIView+Border.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/5.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BorderDirect)
{
    topBorder = 0,
    leftBorder,
    bottomBorder,
    rightBorder
};

@interface UIView(Border)
- (void)setBorder:(BorderDirect)borderDirect withColor:(UIColor *)color andWidth:(CGFloat)width;
- (void)removeBorder:(BorderDirect)borderDirect;
@end

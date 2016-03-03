//
//  UIColor+Extension.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/26.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor(Category)
+(UIColor*)colorFromRBG:(NSInteger)hex;
+(UIColor*)colorFromRBG:(NSInteger)hex withAlpha:(CGFloat)alphaValue;
@end

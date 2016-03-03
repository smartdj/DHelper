//
//  UICommonFunction.h
//  QiyuExplorer
//
//  Created by DJ on 15/12/8.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DUIHelper : NSObject
//计算文字实际占用大小
+ (CGSize)sizeText:(NSString*)text font:(UIFont*)font;
+ (UIWindow *)lastWindow;
@end

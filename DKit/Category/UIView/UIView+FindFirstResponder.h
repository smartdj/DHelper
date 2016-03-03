//
//  UIView+FindFirstResponder.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/13.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>
//查找当前处于激活编辑状态的视图
@interface UIView (FindFirstResponder)
- (UIView *)findFirstResponder;
@end
